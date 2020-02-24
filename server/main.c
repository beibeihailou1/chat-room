#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <sys/socket.h>
#include <pthread.h>
#define BUF_SIZE 100
#define MAX_CLINT 256

void *handle_clnt(void *arg);
void send_msg(char *msg,int len);
void error_handling(char *msg);
int clnt_cnt=0;
int clnt_socks[MAX_CLINT];
pthread_mutex_t mutex;

int main(int argc,char* arg[]) {
    printf("1");
    int serv_sock,clnt_sock;
    struct sockaddr_in serv_adr,clnt_adr;
    socklen_t clnt_adr_sz;
    pthread_t t_id;
    if(argc!=2){
        printf("Usage : %s <port>\n",arg[0]);
        exit(1);
    }
    pthread_mutex_init(&mutex,NULL);
    serv_sock=socket(PF_INET,SOCK_STREAM,0);

    memset(&serv_adr,0, sizeof(serv_adr));
    serv_adr.sin_family=AF_INET;
    serv_adr.sin_addr.s_addr=htonl(INADDR_ANY);
    serv_adr.sin_port=htons(atoi(arg[1]));

    if(bind(serv_sock,(struct sockaddr*)&serv_adr, sizeof(serv_adr))==-1){
        error_handling("Bind error\n");
    }
    if(listen(serv_sock,5)==-1){
        error_handling("listen error\n");
    }

    clnt_adr_sz = sizeof(clnt_adr);
    clnt_sock = accept(serv_sock, (struct sockaddr *) &clnt_adr, &clnt_adr_sz);
    pthread_mutex_lock(&mutex);
    clnt_socks[clnt_cnt++] = clnt_sock;
    pthread_mutex_unlock(&mutex);

    pthread_create(&t_id, NULL, handle_clnt, (void *) &clnt_sock);
    pthread_detach(t_id);
    printf("Connected client IP: %s \n",inet_ntoa(clnt_adr.sin_addr));

    while(1) {
        clnt_adr_sz = sizeof(clnt_adr);
        clnt_sock = accept(serv_sock, (struct sockaddr *) &clnt_adr, &clnt_adr_sz);
        pthread_mutex_lock(&mutex);
        clnt_socks[clnt_cnt++] = clnt_sock;
        pthread_mutex_unlock(&mutex);

        pthread_create(&t_id, NULL, handle_clnt, (void *) &clnt_sock);
        pthread_detach(t_id);
        printf("Connected client IP: %s \n",inet_ntoa(clnt_adr.sin_addr));

        //cout<<"Connected clint IP:"<<inet_ntoa(clnt_adr.sin_addr)<<"\n";
        //printf("Connected client IP: %s \n",inet_ntoa(clnt_adr.sin_addr));
        //printf("Connected client IP: %s \n",inet_ntoa(clnt_adr.sin_addr));
        //printf("Connected Clint:");
    }

    close(serv_sock);
    return 0;
}
void *handle_clnt(void *arg){
    int clnt_sock=*((int *)arg);
    int str_len=0,i;
    char msg[BUF_SIZE];
    str_len=read(clnt_sock,msg, sizeof(msg));
    send_msg(msg,str_len);

    while((str_len=read(clnt_sock,msg, sizeof(msg)))!=0){
        send_msg(msg,str_len);
    }
    pthread_mutex_lock(&mutex);
    for(i=0;i<clnt_cnt;i++){
        if(clnt_sock==clnt_socks[i]){
            while(i++<clnt_cnt-1){
                clnt_socks[i]=clnt_socks[i+1];
            }
            break;
        }
    }
    clnt_cnt--;
    pthread_mutex_unlock(&mutex);
    close(clnt_sock);
    return NULL;
}

void send_msg(char *msg,int len){
    int i;
    pthread_mutex_lock(&mutex);
    for(i=0;i<clnt_cnt;i++){
        write(clnt_socks[i],msg,len);
    }
    pthread_mutex_unlock(&mutex);
}

void error_handling(char *msg){
    fputs(msg,stderr);
    fputc('\n',stderr);
    exit(1);
}
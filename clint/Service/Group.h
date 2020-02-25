//
// Created by jiangsongdong on 2020/2/25.
//

#ifndef CLINT_GROUP_H
#define CLINT_GROUP_H

typedef struct group_msg {
    int from_uid;
    int gid;
    char uname[30];
    char gname[30];
    char msg[1000];
    char time [25];
    struct group_msg *next;
}group_msg_t;

class Group {
    void  Group_send_msg();

};


#endif //CLINT_GROUP_H

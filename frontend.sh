USERID=$(id -u)

#!/bin/bash

source ./common.sh

app_name=nginx

NGINX_SETUP

systemctl_enable_start

rm -rf /usr/share/nginx/html/* 
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip &>>$LOG_FILE
cd /usr/share/nginx/html 
unzip /tmp/frontend.zip &>>$LOG_FILE
CHECK $? "Downloading frontend"

cp /root/common-shell-roboshop/nginx.conf /etc/nginx/nginx.conf
CHECK $? "copying conf files"

systemctl restart nginx 
CHECK $? "restarting nginx"


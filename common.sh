#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOG_FOLDER="/var/log/shell-scripting"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE=$LOG_FOLDER/$SCRIPT_NAME.log
mkdir -p  $LOG_FOLDER

#echo  $LOG_FILE
#tee -a <File_name> -  display output and stores in file
#&>> -<file_name> dont display the output ,just stores the output

root_check()
{

if [ $USERID -ne 0 ]; then
    echo "your not root user please switch to root user" | tee -a $LOG_FILE
fi
}

CHECK()
{
    
    if [ $1 -ne 0 ]; then
        echo -e "$2 ... $R FAILURE $N" | tee -a $LOG_FILE
        
    else
        echo -e "$2 ... $G SUCCESS $N" | tee -a $LOG_FILE
    fi
}

mongo_repo()
{
    cp /root/common-shell_roboshop/mongo.repo /etc/yum.repos.d
    CHECK $? "copying mongo repo file to repository"
}

sed_public()
{
    sed -i 's/127.0.0.1/0.0.0.0/' /etc/$v.confg
    CHECK $? "allowing public access"
}

systemctl_enable_start()
{
    systemctl enable mongod &>> $LOG_FILE
    CHECK $? "Enable MongoDB"

    systemctl start mongod &>> $LOG_FILE
    CHECK $? "mongo started"
}
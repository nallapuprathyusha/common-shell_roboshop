#!bin/bash

source ./common.sh
v=mongod
root_check


dnf list installed mongodb-org &>> $LOG_FILE
CHECK $? "Mongodb check"

#touch /etc/yum.repos.d/mongo.repo
mongo_repo

dnf install mongodb-org -y &>> $LOG_FILE
CHECK $? "mongo installed"

systemctl_enable_start

#SED
#sed -i 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
sed

systemctl restart mongod &>> $LOG_FILE
CHECK $? "restart mongod"
#!/bin/bash

source ./common.sh
root_check
app_name=catalogue

NODEJS_SETUP

USER_SETUP

npm install &>> $LOG_FILE
CHECK $? "Installing denpendencies"

APP_SETUP

systemctl_enable_start

mongo_repo

dnf install mongodb-mongosh -y &>> $LOG_FILE
CHECK $? "Installing mongo client"

mongosh --host mongo.prathyusha.fun </app/db/master-data.js &>> $LOG_FILE
CHECK $? "loading schema" #adding products details in mongodb database server








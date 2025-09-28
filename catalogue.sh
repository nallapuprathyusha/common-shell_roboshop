#!/bin/bash

source ./common.sh

app_name=catalogue

nodejs_setup

system_user

downloading_app

npm install &>> $LOG_FILE
CHECK $? "Installing denpendencies"

denpendencies_reload

mongo_repo

dnf install mongodb-mongosh -y &>> $LOG_FILE
CHECK $? "Installing mongo client"

mongosh --host mongo.prathyusha.fun </app/db/master-data.js &>> $LOG_FILE
CHECK $? "loading schema" #adding products details in mongodb database server




#!/bin/bash

source ./common.sh
app_name=catalogue

NODEJS_SETUP
USER_SETUP

npm install &>> $LOG_FILE
CHECK $? "Installing denpendencies"

APP_SETUP

mongo_repo

dnf install mongodb-mongosh -y &>> $LOG_FILE
CHECK $? "Installing mongo client"

mongosh --host mongo.prathyusha.fun </app/db/master-data.js &>> $LOG_FILE
CHECK $? "loading schema" #adding products details in mongodb database server








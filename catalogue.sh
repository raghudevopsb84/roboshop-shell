component_name=catalogue
source common.sh

cp mongo.repo /etc/yum.repos.d/mongo.repo

nodejs

dnf install mongodb-mongosh -y
mongosh --host mongodb-dev.rdevopsb84.online </app/db/master-data.js

systemd_setup



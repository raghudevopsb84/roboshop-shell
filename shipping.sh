set -e

if [ -z "$1" ]; then
  echo Input DB Password is missing
  exit
fi

component_name=shipping
source common.sh

java

dnf install mysql -y
for file in schema app-user master-data; do
  mysql -h mysql-dev.rdevopsb84.online -uroot -p$1 < /app/db/$file.sql
done

systemd_setup

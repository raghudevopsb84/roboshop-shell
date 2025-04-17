component_name=cart
source common.sh

nodejs

cp cart.service /etc/systemd/system/cart.service

useradd roboshop
rm -rf /app
mkdir /app
cd /app
npm install
curl -L -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart-v3.zip
cd /app
unzip /tmp/cart.zip
cd /app
npm install

systemd_setup


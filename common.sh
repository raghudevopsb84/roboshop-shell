pwd=$(pwd)


systemd_setup() {
  cp ${pwd}/${component_name}.service /etc/systemd/system/${component_name}.service
  systemctl daemon-reload
  systemctl enable ${component_name}
  systemctl start ${component_name}
}

app_pre_setup() {
  useradd roboshop
  rm -rf /app
  mkdir /app
  cd /app
  npm install
  curl -L -o /tmp/${component_name}.zip https://roboshop-artifacts.s3.amazonaws.com/${component_name}-v3.zip
  unzip /tmp/${component_name}.zip
}

nodejs() {
  dnf module disable nodejs -y
  dnf module enable nodejs:20 -y
  dnf install nodejs -y
  app_pre_setup
  npm install
}

python() {
  dnf install python3 gcc python3-devel -y
  app_pre_setup
  pip3 install -r requirements.txt
}

#!/bin/bash

set -eux

cd $(cd $(dirname $0); pwd)

cd ../go
make

ssh -t root@isucon9.catatsuy.org "systemctl stop isucari.golang.service"
scp ./isucari root@isucon9.catatsuy.org:/home/isucon/isucari/webapp/go/isucari
ssh -t root@isucon9.catatsuy.org "chown isucon:isucon /home/isucon/isucari/webapp/go/isucari"

ssh -t root@isucon9.catatsuy.org "echo > /var/log/nginx/access.log"
ssh -t root@isucon9.db "echo > /var/log/mysql/mysql-slow.log"

ssh -t root@isucon9.db "systemctl restart mysql"

ssh -t root@isucon9.catatsuy.org "systemctl start isucari.golang.service"
ssh -t root@isucon9.catatsuy.org "systemctl restart nginx"

echo "deployed!" | notify_slack

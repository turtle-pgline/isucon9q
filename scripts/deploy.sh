#!/bin/bash

set -eux

cd $(cd $(dirname $0); pwd)

cd ../go
make

ssh -t root@isucon9.catatsuy.org "systemctl stop isucari.golang.service"
scp ./isucari root@isucon9.catatsuy.org:/home/isucon/isucari/webapp/go/isucari
ssh -t root@isucon9.catatsuy.org "chown isucon:isucon /home/isucon/isucari/webapp/go/isucari"
ssh -t root@isucon9.catatsuy.org "systemctl start isucari.golang.service"
ssh -t root@isucon9.catatsuy.org "/home/isucon/isucari/webapp/scripts/server/all_restart.sh"

echo "deployed!" | notify_slack

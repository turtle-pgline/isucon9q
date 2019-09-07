#!/bin/bash

set -eux

echo > /var/log/nginx/access.log
echo > /var/log/mysql/mysql-slow.log
systemctl restart nginx
systemctl restart mysql
systemctl restart isucari.golang.service

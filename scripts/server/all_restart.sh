#!/bin/bash

set -eux

echo > /var/log/nginx/access.log
systemctl restart nginx
systemctl restart mysql
systemctl restart isucari.golang.service

#!/bin/bash

set -eux

bash ./log_rotate.sh

systemctl restart nginx
systemctl restart mysql
systemctl restart isucari.golang.service

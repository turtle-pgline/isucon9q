#!/bin/bash

set -eux

echo > /var/log/nginx/access.log
systemctl restart nginx

#!/bin/bash

docker network ls | grep puppeteer_issue_4952 || docker network create puppeteer_issue_4952

docker-compose up -d

URL=$(docker-compose port httpd 80)

echo "==> Access the site on http://$URL and follow instructions in README.md"

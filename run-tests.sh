#!/bin/bash

echo ''
echo '=> Setting up the website'
echo ''

# ./setup.sh

echo ''
echo '=> Getting some Docker images with Puppeteer 1.19 and 1.20'
echo ''

docker pull dcycle/browsertesting:3.2019-09-18-18-44-31-UTC
docker pull dcycle/browsertesting:3.2019-09-09-20-39-39-UTC

echo ''
echo '=> Running our tests on version 1.19 of Puppeteer'
echo ''

docker run --rm -ti --entrypoint "/bin/bash" dcycle/browsertesting:3.2019-09-09-20-39-39-UTC -c 'cat /app/package-lock.json | grep puppeteer --after-context=1 | grep version'

docker run --rm -e SCREENSHOT=puppeteer-1.19 \
  --network puppeteer_issue_4952 \
  -v "$(pwd)"/screenshots:/artifacts/screenshots \
  -v "$(pwd)"/dom-captures:/artifacts/dom-captures \
  -v "$(pwd)"/tests:/app/test \
  dcycle/browsertesting:3.2019-09-09-20-39-39-UTC

echo ''
echo '=> Running our tests on version 1.20 of Puppeteer'
echo ''

docker run --rm -ti --entrypoint "/bin/bash" dcycle/browsertesting:3.2019-09-18-18-44-31-UTC -c 'cat /app/package-lock.json | grep puppeteer --after-context=1 | grep version'

docker run --rm -e SCREENSHOT=puppeteer-1.20 \
  --network puppeteer_issue_4952 \
  -v "$(pwd)"/screenshots:/artifacts/screenshots \
  -v "$(pwd)"/dom-captures:/artifacts/dom-captures \
  -v "$(pwd)"/tests:/app/test \
  dcycle/browsertesting:3.2019-09-18-18-44-31-UTC

echo ''
echo '=> Destroying the website'
echo ''

./destroy.sh

echo ''
echo '=> Please see README for next steps'
echo ''

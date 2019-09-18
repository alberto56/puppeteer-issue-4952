This project is designed to demonstrate [Puppeteer issue 4952](https://github.com/GoogleChrome/puppeteer/issues/4952).

To run this:
-----

(1) Make sure you have Docker on your machine.

(2) Run "./setup.sh"

(3) At the end of the script you will get a local URL which looks like http://0.0.0.0:32779 to visit a web page, open it on the latest version of Chrome.

(4) Confirm you see the "Add Organization" link.

(5) Run "./run-tests.sh"



To destroy the environment:
-----

    run ./destroy.sh

We are using Puppeteer on a Docker image.
-----

See https://hub.docker.com/r/dcycle/browsertesting
See https://github.com/dcycle/docker-browsertesting

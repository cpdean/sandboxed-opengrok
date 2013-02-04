Easy setup for a sandboxed copy of OpenGrok with all its dependencies, built from source!

To get puppet ready, do this to get the vagrant vm running:

1. Clone this repo
1. vagrant up
1. vagrant ssh
1. cd OpenGrok
1. ant

Note: this is going to download a copy of Ubuntu 12.04 32bit and then a bunch of dependencies, so dial-up users beware.


### TODO
* Get `ant default` working by adding junit and hamcrest to the puppet provisioning.
* Get JUnit tests to pass.

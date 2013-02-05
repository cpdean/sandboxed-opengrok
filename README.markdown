Easy setup for a sandboxed copy of OpenGrok with all its dependencies, built from source!

To get puppet ready, do this to get the vagrant vm running:

1. Clone this repo
1. vagrant up
1. vagrant ssh
1. cd OpenGrok
1. ant

*DIALUP USERS BEWARE* - This is going to download a copy of Ubuntu 12.04 32bit and then a bunch of dependencies.  Nearly a gig or so.


### TODO
* Get `ant default` tests to be readable and passing.
* Get JUnit tests for `mvn install` to pass.

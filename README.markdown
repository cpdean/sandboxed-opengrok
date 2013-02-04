Easy setup for a sandboxed copy of OpenGrok with all its dependencies, built from source!


These instructions don't work yet, because the current manifest requires `file_line`, as part of the stdlib module in puppet.

I'll figure out how to properly get this into the provisioning, but it's not ready yet because puppet doesn't seem to allow you to bootstrap the provisioning of its own modules.  The compilation step requires everything's defined first.

To get puppet ready, do this to get the vagrant vm running:

1. Clone this repo
1. vagrant up

Now install the puppet stdlib:

    vagrant ssh
    sudo mkdir /etc/puppet/modules
    sudo puppet module install puppetlabs/stdlib

Now log out of the vm and:

1. vagrant provision
1. cd OpenGrok
1. ant default

Note: this is going to download a copy of Ubuntu 12.04 32bit and then a bunch of dependencies, so dial-up users beware.

# wp-vagrant-apache

A set of config files and instructions to bootstrap a Vagrant LAMP stack suitable for developing Wordpress sites.

If it all works okay you should end up with a Vagrant box set up with apache, php and mysql.

## Getting started

1. Check the [requirements](INSTALL.md).
2. Run `vagrant-up` to run an Ubuntu LAMP stack.
3. Go to [http://localhost:8888/](http://localhost:8888/) to see the files served from `../htdocs`.

The initial mysql root password is set to: `wp-skeleton`.

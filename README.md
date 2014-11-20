# perforce
[![wercker status](https://app.wercker.com/status/03f6d175c20c0148e52b8a2d880368ee/m "wercker status")](https://app.wercker.com/project/bykey/03f6d175c20c0148e52b8a2d880368ee)

This cookbook can be used to install and manage the Perforce source code
management system.

# Overview

Install the Chef Development Kit, available via http://downloads.getchef.com

On Mac OS X and Linux, configure the PATH and GEM environment variables with:

    $ eval "$(chef shell-init bash)"

All cookbook-related development activities are Rake tasks:

## Prerequisites

Clone this repository:

    git clone https://github.com/misheska-cookbooks/perforce

Install the [Chef Development Kit](http://www.getchef.com/downloads/chef-dk)
for your platform.

Install the following virtualization software:

* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* [Vagrant](https://www.vagrantup.com/downloads.html)

Attributes
==========

Perforce Server ('p4d') attributes are in the `node['perforce']['p4d']`
namespace:

Attribute              | Description |Type | Default
-----------------------|-------------|-----|--------
group                  | p4d daemon group | String | 'perforce'
host                   | p4d hostname | String | 'localhost'
p4journal              | Name and path of the file to which holds the Perforce database's journal data | String | '/var/log/p4d/journal'
p4log                  | Name and path of the file to which p4d errrors are logged | String | '/var/log/p4d/p4error'
p4root                 | Directory in which the p4d service stores its files and subdirectories | String | '/usr/local/p4root'
user                   | p4d daemon user | String | 'perforce'
version                | Version of the p4d daemon software to install | String | '14.2'

Recipes
=======

Here's the recipes in the cookbook and how to use them in your environment.

p4d
---
Installs and configures the Perforce server (p4d) as a daemon/service.

p4
--
Installs and configures the Perforce command line cline (p4).

p4v
---
Installs and configures the Perforce GUI client (p4v).

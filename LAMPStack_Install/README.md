# LAMStack_Install


Build Status Cookbook Version

It installs and configures LAMP Stack. 

Requirements

Platforms

Ubuntu 14.04


chef-client version: 13.2.20
delivery version: master (73ebb72a6c42b3d2ff5370c476be800fee7e5427)
berks version: 6.3.0
kitchen version: 1.17.0
inspec version: 1.33.1

Cookbooks

build-essential
mysql
Attributes

node['php']['install_method'] = method to install php with, default package.
node['php']['directives'] = Hash of directives and values to append to php.ini, default {}.
node['php']['pear'] = Name of the pear executable to use, default pear.
The file also contains the following attribute types:

platform specific locations and settings.
source installation settings
Resources

This cookbook includes resources for managing:

PEAR channels
PEAR/PECL packages
php_pear_channel

PEAR Channels are alternative sources for PEAR packages. This resource provides and easy way to manage these channels.

Actions
Installs Apache2
Installs Mysql
Installs php

Recipes

default

Include the default recipe in a run list, to get php. By default php is installed from packages but this can be changed by using the install_method attribute.

default.rb recipe includes 
apache.rb recipe
mysql.rb recipe  and
php.rb recipe

# using apt
package 'php5'

# using pear resource
package 'php-pear'
Usage

Simply include the default recipe where ever you would like LAMP Stack installed. 

Role example:

name 'LAMPStack_Install'
description 'Install php from source'

run_list(
  'recipe[default]'
)
Maintainers
Rajeshwari Makond

License

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

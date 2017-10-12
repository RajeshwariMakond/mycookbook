# HashicorpVault
Hashicorp Vault Cookbook

Installs Hashicorp Vault on Ubuntu 14.04

REQUIREMENTS: Enable Hashicorp Vault in dev mode.

Platform Ubuntu 14.04

This Cookbook requires chef-client version: 13.2.20 delivery version: master (73ebb72a6c42b3d2ff5370c476be800fee7e5427) berks version: 6.3.0 kitchen version: 1.17.0 inspec version: 1.33.1

Recipes HashicorpVault::default

Just include HashicorpVault default recipe in your node's run_list:

{ "name":"my_node", "run_list": [ "recipe[HashicorpVault]" ] } 

Default recipe runs two commands
vault server -dev    and
export VAULT_ADDR='http://127.0.0.1:8200'

License and Authors
Authors: Rajeshwari 
License: No need of license to enable vault in dev mode. 

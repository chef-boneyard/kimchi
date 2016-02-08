# Kimchi Cookbook
[![Build Status](https://travis-ci.org/chef-cookbooks/kimchi.svg?branch=master)](http://travis-ci.org/chef-cookbooks/kimchi) [![Cookbook Version](https://img.shields.io/cookbook/v/kimchi.svg)](https://supermarket.chef.io/cookbooks/kimchi)

The kimchi cookbook is designed to create a testing instance of the kimchi project using test kitchen.

## Platform Support
The following platforms have been tested:
- Ubuntu 14.04
- Centos 6.6

## Requirements
- chefdk - [https://downloads.chef.io/chef-dk/](https://downloads.chef.io/chef-dk/)
- VMWare Fusion

## To use for development
- Clone this repo
- Run `bundle install` from the repo directory
- Run `bundle exec kitchen list` to see OS options
- Run `bundle exec kitchen converge <instance_name>` to spin up a VM
- kimchi will be running at [https://localhost:8001](https://localhost:8001) - username/password - vagrant/vagrant

## Caveats
Since kimchi is a webui for the KVM hypervisor, this cookbook requires VMWare Fusion or physical hardware to function completely. Virtualbox does not support 'VM within a VM' capabilities (no VT-x passthrough).

## License & Authors
- Author:: Scott Hain ([shain@chef.io](mailto:shain@chef.io))

```text
Copyright:: 2015 Chef Software, Inc

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

name 'kimchi'
maintainer 'Scott Hain'
maintainer_email 'shain@chef.io'
license 'Apache 2.0'
description 'Installs and onfigures kimchi, the kvm graphical interface'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.0.2'

supports 'centos'
supports 'amazon'
supports 'scientific'
supports 'redhat'
supports 'oracle'
supports 'debian'
supports 'ubuntu'

depends 'runit', '>= 1.6'
depends 'iptables'

source_url 'https://github.com/chef-cookbooks/kimchi' if respond_to?(:source_url)
issues_url 'https://github.com/chef-cookbooks/kimchi/issues' if respond_to?(:issues_url)

chef_version '>= 11' if respond_to?(:chef_version)

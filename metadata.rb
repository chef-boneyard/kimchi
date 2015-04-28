name             'kimchi'
maintainer       'Scott Hain'
maintainer_email 'shain@chef.io'
license          'Apache 2.0'
description      'Installs/Configures kimchi'
long_description 'Installs/Configures kimchi'
version          '0.0.1'

supports 'centos'
supports 'ubuntu'

depends 'runit', '~> 1.6'
depends 'iptables', '~> 0.13.2'

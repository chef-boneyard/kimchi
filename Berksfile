source 'https://supermarket.chef.io'

metadata

cookbook 'runit', git: 'git://github.com/hw-cookbooks/runit.git'
cookbook 'iptables'

group :integration do
  cookbook 'apt',      '~> 2.3'
  cookbook 'yum-epel',  '~> 0.3'
end

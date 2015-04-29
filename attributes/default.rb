default['kimchi'].tap do |kimchi|
  kimchi['user']       = 'root'
  kimchi['group']      = 'root'
  kimchi['host']       = '0.0.0.0'
  kimchi['version']    = 'master'
end

default['kimchi']['packages'] = case node['platform_family']
                                when 'debian' then %w( gcc make autoconf automake gettext git python-cherrypy3 python-cheetah python-libvirt libvirt-bin python-imaging python-pam python-m2crypto python-jsonschema qemu-kvm libtool python-psutil python-ethtool sosreport python-ipaddr python-ldap python-lxml nfs-common open-iscsi lvm2 xsltproc python-parted nginx python-guestfs libguestfs-tools websockify novnc spice-html5 )
                                when 'rhel' then %w( gcc make autoconf automake gettext-devel git python-cherrypy python-cheetah libvirt-python libvirt python-imaging PyPAM m2crypto python-jsonschema rpm-build qemu-kvm python-psutil python-ethtool sos python-ipaddr python-ldap python-lxml nfs-utils iscsi-initiator-utils libxslt pyparted nginx python-libguestfs libguestfs-tools python-websockify novnc spice-html5 python-unittest2 python-ordereddict )
                                end

# Ensure directories are created before manifests
# Create files in /etc/dconf/db/local.d

class stigs::redhat7::prerequisites::gnome inherits stigs::redhat7::redhat7 {

file { [ '/etc/dconf',
         '/etc/dconf/db',
         '/etc/dconf/db/local.d', ]:
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
    before =>  [ Class['stigs::redhat7::warning_banner::rhel_07_010030'], 
                 Class['stigs::redhat7::warning_banner::rhel_07_010031'], 
                 Class['stigs::redhat7::desktop::rhel_07_010060'], ],

  }

}

# File ensures the pwquality.conf file exists before adding 
# individual lines to the files
class stigs::redhat7::prerequisites::authentication inherits stigs::redhat7::redhat7 {

  file { '/etc/pam.d/system-auth-ac':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }
  ->
  file { '/etc/pam.d/system-auth':
    ensure  => 'link',
    target  => '/etc/pam.d/system-auth-ac',
    before  => [ Class['stigs::redhat7::authentication::rhel_07_010170'], ],
  }

  file { '/etc/libuser.conf':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    before =>  [ Class['stigs::redhat7::authentication::rhel_07_010190'], ],
  }

  file { '/etc/login.defs':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    before =>  [ Class['stigs::redhat7::authentication::rhel_07_010180'],
                 Class['stigs::redhat7::authentication::rhel_07_010200'], ],
  }

}


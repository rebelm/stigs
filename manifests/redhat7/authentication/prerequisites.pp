# File ensures the pwquality.conf file exists before adding 
# individual lines to the files
class stigs::redhat7::authentication::prerequisites inherits stigs::redhat7::redhat7 {

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

}


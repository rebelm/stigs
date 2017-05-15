class stigs::redhat7::prerequisites::authentication::pam inherits stigs::redhat7::redhat7 {

   file { '/etc/pam.d/system-auth-ac':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }
  ->
  file { '/etc/pam.d/system-auth':
    ensure => 'link',
    target => '/etc/pam.d/system-auth-ac',
    before => [ Class['stigs::redhat7::authentication::pam::rhel_07_010200'],
                Class['stigs::redhat7::authentication::pam::rhel_07_010270'],
                Class['stigs::redhat7::authentication::pam::rhel_07_010290'], ],
  }

}

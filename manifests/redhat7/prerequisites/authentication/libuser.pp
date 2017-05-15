class stigs::redhat7::prerequisites::authentication::libuser inherits stigs::redhat7::redhat7 {
  file { '/etc/libuser.conf':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    before => [ Class['stigs::redhat7::authentication::libuser::rhel_07_010220'] ],
  }

}

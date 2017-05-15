class stigs::redhat7::prerequisites::authentication::login-defs inherits stigs::redhat7::redhat7 {

  file { '/etc/login.defs':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    before =>  [ Class['stigs::redhat7::authentication::login-defs::rhel_07_010210'],
                 Class['stigs::redhat7::authentication::login-defs::rhel_07_010230'],
                 Class['stigs::redhat7::authentication::login-defs::rhel_07_010250'], ],
  }

}

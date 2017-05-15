class stigs::redhat7::prerequisites::authentication::useradd inherits stigs::redhat7::redhat7 {
  file { '/etc/default/useradd':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    before => [ Class['stigs::redhat7::authentication::useradd::rhel_07_010310'] ],
  }

}

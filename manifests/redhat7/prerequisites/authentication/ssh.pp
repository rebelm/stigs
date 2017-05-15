class stigs::redhat7::prerequisites::authentication::ssh inherits stigs::redhat7::redhat7 {

 file {'/etc/ssh/sshd_config':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0600',
    before => [ Class['stigs::redhat7::authentication::ssh::rhel_07_010300'], ],
  }

}

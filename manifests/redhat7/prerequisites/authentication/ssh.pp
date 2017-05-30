class stigs::redhat7::prerequisites::authentication::ssh inherits stigs::redhat7::redhat7 {

 file {'/etc/ssh/sshd_config':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0600',
    before => [ Class['stigs::redhat7::authentication::ssh::rhel_07_010300'],
                Class['stigs::redhat7::authentication::ssh::rhel_07_010460'],
                Class['stigs::redhat7::authentication::ssh::rhel_07_010470'],
                Class['stigs::redhat7::authentication::ssh::rhel_07_040170'],
                Class['stigs::redhat7::authentication::ssh::rhel_07_040320'],
                Class['stigs::redhat7::authentication::ssh::rhel_07_040330'],
                Class['stigs::redhat7::authentication::ssh::rhel_07_040340'], 
                Class['stigs::redhat7::authentication::ssh::rhel_07_040350'],
                Class['stigs::redhat7::authentication::ssh::rhel_07_040360'],
                Class['stigs::redhat7::authentication::ssh::rhel_07_040370'],
                Class['stigs::redhat7::authentication::ssh::rhel_07_040380'],
                Class['stigs::redhat7::authentication::ssh::rhel_07_040390'],
                Class['stigs::redhat7::authentication::ssh::rhel_07_040400'],
                Class['stigs::redhat7::authentication::ssh::rhel_07_040410'],
                Class['stigs::redhat7::authentication::ssh::rhel_07_040420'],
                Class['stigs::redhat7::authentication::ssh::rhel_07_040430'],
                Class['stigs::redhat7::authentication::ssh::rhel_07_040440'],
                Class['stigs::redhat7::authentication::ssh::rhel_07_040450'],
                Class['stigs::redhat7::authentication::ssh::rhel_07_040460'],
                Class['stigs::redhat7::authentication::ssh::rhel_07_040470'], ],
  }

}

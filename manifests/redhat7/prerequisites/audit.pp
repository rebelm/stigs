class stigs::redhat7::prerequisites::audit inherits stigs::redhat7::redhat7 {

  file { '/etc/audit/rules.d/audit.rules':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0600',
    before =>  [ Class['stigs::redhat7::audit::rhel_07_030370'],
                 Class['stigs::redhat7::audit::rhel_07_030380'],
                 Class['stigs::redhat7::audit::rhel_07_030380'],
                 Class['stigs::redhat7::audit::rhel_07_030390'],
                 Class['stigs::redhat7::audit::rhel_07_030400'],
                 Class['stigs::redhat7::audit::rhel_07_030410'],
                 Class['stigs::redhat7::audit::rhel_07_030420'],
                 Class['stigs::redhat7::audit::rhel_07_030430'],
                 Class['stigs::redhat7::audit::rhel_07_030440'],
                 Class['stigs::redhat7::audit::rhel_07_030450'],
                 Class['stigs::redhat7::audit::rhel_07_030460'],
                 Class['stigs::redhat7::audit::rhel_07_030470'],
                 Class['stigs::redhat7::audit::rhel_07_030480'],
                 Class['stigs::redhat7::audit::rhel_07_030490'],
                 Class['stigs::redhat7::audit::rhel_07_030500'],
                 Class['stigs::redhat7::audit::rhel_07_030510'], ],
   }

}

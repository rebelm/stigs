class stigs::redhat7::prerequisites::selinux inherits stigs::redhat7::redhat7 {

  file { '/etc/selinux/config':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    before =>  [ Class['stigs::redhat7::system_integrity::rhel_07_020210'],
                 Class['stigs::redhat7::system_integrity::rhel_07_020220'], ],
   }

}

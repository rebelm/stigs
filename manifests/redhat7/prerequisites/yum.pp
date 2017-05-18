class stigs::redhat7::prerequisites::yum inherits stigs::redhat7::redhat7 {

  file { '/etc/yum.conf':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
   }
  ->
  file_line { 'yum-main':
    ensure =>  'present',
    line =>  '[main]',
    path =>  '/etc/yum.conf',
    before =>  [ Class['stigs::redhat7::system_integrity::rhel_07_020050'],
                 Class['stigs::redhat7::system_integrity::rhel_07_020060'],
                 Class['stigs::redhat7::system_integrity::rhel_07_020070'],
                 Class['stigs::redhat7::system_integrity::rhel_07_020200'], ],
  }

}

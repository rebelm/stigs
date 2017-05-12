# File ensures the pwquality.conf file exists before adding 
# individual lines to the files
class stigs::redhat7::prerequisites::password_complexity inherits stigs::redhat7::redhat7 {

  file { '/etc/security/pwquality.conf':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    before =>  [ Class['stigs::redhat7::password_complexity::rhel_07_010090'], 
                 Class['stigs::redhat7::password_complexity::rhel_07_010100'], 
                 Class['stigs::redhat7::password_complexity::rhel_07_010110'], 
                 Class['stigs::redhat7::password_complexity::rhel_07_010120'], 
                 Class['stigs::redhat7::password_complexity::rhel_07_010130'], 
                 Class['stigs::redhat7::password_complexity::rhel_07_010140'], 
                 Class['stigs::redhat7::password_complexity::rhel_07_010150'], 
                 Class['stigs::redhat7::password_complexity::rhel_07_010160'], ],
  }



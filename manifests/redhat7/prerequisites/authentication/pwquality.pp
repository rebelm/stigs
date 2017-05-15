# File ensures the pwquality.conf file exists before adding 
# individual lines to the files
class stigs::redhat7::prerequisites::authentication::pwquality inherits stigs::redhat7::redhat7 {

  file { '/etc/security/pwquality.conf':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    before =>  [ Class['stigs::redhat7::authentication::pwquality::rhel_07_010120'], 
                 Class['stigs::redhat7::authentication::pwquality::rhel_07_010130'], 
                 Class['stigs::redhat7::authentication::pwquality::rhel_07_010140'], 
                 Class['stigs::redhat7::authentication::pwquality::rhel_07_010150'], 
                 Class['stigs::redhat7::authentication::pwquality::rhel_07_010160'],
                 Class['stigs::redhat7::authentication::pwquality::rhel_07_010170'],
                 Class['stigs::redhat7::authentication::pwquality::rhel_07_010180'],
                 Class['stigs::redhat7::authentication::pwquality::rhel_07_010190'],
                 Class['stigs::redhat7::authentication::pwquality::rhel_07_010280'], ],
  }

}

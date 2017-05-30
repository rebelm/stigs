# STIG-ID: RHEL-07-020620
# Rule-ID: SV-86639r1_rule
# Vuln-ID: V-72015
# Severity: CAT II 
# Class: Unclass

class stigs::redhat7::homedir::rhel_07_020620 inherits stigs::redhat7::redhat7 {
  
  if $rhel_07_020620 == 'present' {
    $file = 'file'
    $cron = 'present'
  }
  else {
    $file = 'absent'
    $cron = 'absent'
  }

  file { '/usr/local/bin/enforce-assigned-home-directory-created.sh':
    ensure => $file, 
    source => 'puppet:///modules/stigs/redhat7/rhel_07_020620.sh',
    owner  => 'root',
    group  => 'root',
    mode   =>  '0750',
  }

  cron { 'STIG-ID: RHEL-07-020620':
    ensure  => $cron,
    command => '/usr/local/bin/enforce-assigned-home-directory-created.sh',
    user    => 'root',
    hour    => 2,
    minute  => 36,
    require =>  File['/usr/local/bin/enforce-assigned-home-directory-created.sh'],
  }

}

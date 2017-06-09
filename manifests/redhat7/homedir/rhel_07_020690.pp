# STIG-ID: RHEL-07-020690
# Rule-ID: SV-86653r1_rule
# Vuln-ID: V-72029
# Severity: CAT II 
# Class: Unclass

class stigs::redhat7::homedir::rhel_07_020690 inherits stigs::redhat7::redhat7 {
  
  if $rhel_07_020690 == 'present' {
    $file = 'file'
    $cron = 'present'
  }
  else {
    $file = 'absent'
    $cron = 'absent'
  }

  file { '/usr/local/bin/enforce-home-config-owner.sh':
    ensure => $file, 
    source => 'puppet:///modules/stigs/redhat7/rhel_07_020690.sh',
    owner  => 'root',
    group  => 'root',
    mode   =>  '0750',
  }

  cron { 'STIG-ID: RHEL-07-020690':
    ensure  => $cron,
    command => '/usr/local/bin/enforce-home-config-owner.sh',
    user    => 'root',
    hour    => 2,
    minute  => 48,
    require =>  File['/usr/local/bin/enforce-home-config-owner.sh'],
  }

}

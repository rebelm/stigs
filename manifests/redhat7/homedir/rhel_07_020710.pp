# STIG-ID: RHEL-07-020710
# Rule-ID: SV-86657r2_rule
# Vuln-ID: V-72033
# Severity: CAT II 
# Class: Unclass

class stigs::redhat7::homedir::rhel_07_020710 inherits stigs::redhat7::redhat7 {
  
  if $rhel_07_020710 == 'present' {
    $file = 'file'
    $cron = 'present'
  }
  else {
    $file = 'absent'
    $cron = 'absent'
  }

  file { '/usr/local/bin/enforce-strict-home-initialization.sh':
    ensure => $file, 
    source => 'puppet:///modules/stigs/redhat7/rhel_07_020710.sh',
    owner   => 'root',
    group  => 'root',
    mode   =>  '0750',
  }

  cron { 'STIG-ID: RHEL-07-020710':
    ensure  => $cron,
    command => '/usr/local/bin/enforce-strict-home-initialization.sh',
    user    => 'root',
    hour    => 2,
    minute  => 50,
    require =>  File['/usr/local/bin/enforce-strict-home-initialization.sh'],
  }

}

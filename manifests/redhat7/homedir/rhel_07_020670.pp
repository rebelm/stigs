# STIG-ID: RHEL-07-020670
# Rule-ID: SV-86649r1_rule
# Vuln-ID: V-72025
# Severity: CAT II 
# Class: Unclass

class stigs::redhat7::homedir::rhel_07_020670 inherits stigs::redhat7::redhat7 {
  
  if $rhel_07_020670 == 'present' {
    $file = 'file'
    $cron = 'present'
  }
  else {
    $file = 'absent'
    $cron = 'absent'
  }

  file { '/usr/local/bin/enforce-home-directory-group-ownership-recursive.sh':
    ensure => $file, 
    source => 'puppet:///modules/stigs/redhat7/rhel_07_020670.sh',
    owner  => 'root',
    group  => 'root',
    mode   =>  '0750',
  }

  cron { 'STIG-ID: RHEL-07-020670':
    ensure  => $cron,
    command => '/usr/local/bin/enforce-home-directory-group-ownership-recursive.sh',
    user    => 'root',
    hour    => 2,
    minute  => 42,
    require =>  File['/usr/local/bin/enforce-home-directory-group-ownership-recursive.sh'],
  }

}

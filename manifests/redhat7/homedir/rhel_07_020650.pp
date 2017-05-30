# STIG-ID: RHEL-07-020650
# Rule-ID: SV-86645r2_rule
# Vuln-ID: V-72021
# Severity: CAT II 
# Class: Unclass

class stigs::redhat7::homedir::rhel_07_020650 inherits stigs::redhat7::redhat7 {
  
  if $rhel_07_020650 == 'present' {
    $file = 'file'
    $cron = 'present'
  }
  else {
    $file = 'absent'
    $cron = 'absent'
  }

  file { '/usr/local/bin/enforce-home-directory-group-ownership.sh':
    ensure => $file, 
    source => 'puppet:///modules/stigs/redhat7/rhel_07_020650.sh',
    owner  => 'root',
    group  => 'root',
    mode   =>  '0750',
  }

  cron { 'STIG-ID: RHEL-07-020650':
    ensure  => $cron,
    command => '/usr/local/bin/enforce-home-directory-group-ownership.sh',
    user    => 'root',
    hour    => 2,
    minute  => 39,
    require =>  File['/usr/local/bin/enforce-home-directory-group-ownership.sh'],
  }

}

# STIG-ID: RHEL-07-020660
# Rule-ID: SV-86643r2_rule
# Vuln-ID: V-72019
# Severity: CAT II 
# Class: Unclass

class stigs::redhat7::homedir::rhel_07_020660 inherits stigs::redhat7::redhat7 {
  
  if $rhel_07_020660 == 'present' {
    $file = 'file'
    $cron = 'present'
  }
  else {
    $file = 'absent'
    $cron = 'absent'
  }

  file { '/usr/local/bin/enforce-home-directory-ownership-recursive.sh':
    ensure => $file, 
    source => 'puppet:///modules/stigs/redhat7/rhel_07_020660.sh',
    owner  => 'root',
    group  => 'root',
    mode   =>  '0750',
  }

  cron { 'STIG-ID: RHEL-07-020660':
    ensure  => $cron,
    command => '/usr/local/bin/enforce-home-directory-ownership-recursive.sh',
    user    => 'root',
    hour    => 2,
    minute  => 40,
    require =>  File['/usr/local/bin/enforce-home-directory-ownership-recursive.sh'],
  }

}

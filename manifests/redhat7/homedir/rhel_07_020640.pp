# STIG-ID: RHEL-07-020640
# Rule-ID: SV-86643r2_rule
# Vuln-ID: V-72019
# Severity: CAT II 
# Class: Unclass

class stigs::redhat7::homedir::rhel_07_020640 inherits stigs::redhat7::redhat7 {
  
  if $rhel_07_020640 == 'present' {
    $file = 'file'
    $cron = 'present'
  }
  else {
    $file = 'absent'
    $cron = 'absent'
  }

  file { '/usr/local/bin/enforce-home-directory-ownership.sh':
    ensure => $file, 
    source => 'puppet:///modules/stigs/redhat7/rhel_07_020640.sh',
    owner  => 'root',
    group  => 'root',
    mode   =>  '0750',
  }

  cron { 'STIG-ID: RHEL-07-020640':
    ensure  => $cron,
    command => '/usr/local/bin/enforce-home-directory-ownership.sh',
    user    => 'root',
    hour    => 2,
    minute  => 38,
    require =>  File['/usr/local/bin/enforce-home-directory-ownership.sh'],
  }

}

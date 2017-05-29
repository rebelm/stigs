# STIG-ID: RHEL-07-040550
# Rule-ID: SV-86903r1_rule
# Vuln-ID: V-72279
# Severity: CAT 1
# Class: Unclass

class stigs::redhat7::authentication::ssh::rhel_07_040550 inherits stigs::redhat7::redhat7 {
  
  if $rhel_07_040550 == 'present' {
    $file = 'file'
    $cron = 'present'
  }
  else {
    $file = 'absent'
    $cron = 'absent'
  }

  file { '/usr/local/bin/enforce-no-shosts.equiv.sh':
    ensure => $file, 
    source => 'puppet:///modules/stigs/redhat7/rhel_07_040550.sh',
    owner  => 'root',
    group  => 'root',
    mode   =>  '0750',
  }

  cron { 'STIG-ID: RHEL-07-040550':
    ensure  => $cron,
    command => '/usr/local/bin/enforce-no-shosts.equiv.sh',
    user    => 'root',
    hour    => 2,
    minute  => 29,
    require =>  File['/usr/local/bin/enforce-no-shosts.equiv.sh'],
  }

}

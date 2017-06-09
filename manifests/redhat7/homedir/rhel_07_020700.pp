# STIG-ID: RHEL-07-020700
# Rule-ID: SV-86655r2_rule
# Vuln-ID: V-72031
# Severity: CAT II 
# Class: Unclass

class stigs::redhat7::homedir::rhel_07_020700 inherits stigs::redhat7::redhat7 {
  
  if $rhel_07_020700 == 'present' {
    $file = 'file'
    $cron = 'present'
  }
  else {
    $file = 'absent'
    $cron = 'absent'
  }

  file { '/usr/local/bin/enforce-home-config-group.sh':
    ensure => $file, 
    source => 'puppet:///modules/stigs/redhat7/rhel_07_020700.sh',
    owner   => 'root',
    group  => 'root',
    mode   =>  '0750',
  }

  cron { 'STIG-ID: RHEL-07-020700':
    ensure  => $cron,
    command => '/usr/local/bin/enforce-home-config-group.sh',
    user    => 'root',
    hour    => 2,
    minute  => 49,
    require =>  File['/usr/local/bin/enforce-home-config-group.sh'],
  }

}

# STIG-ID: RHEL-07-040410
# Rule-ID: SV-86879r1_rule
# Vuln-ID: V-72255
# Severity: CAT I1
# Class: Unclass

class stigs::redhat7::authentication::ssh::rhel_07_040410 inherits stigs::redhat7::redhat7 {
  
  if $rhel_07_040410 == 'present' {
    $file = 'file'
    $cron = 'present'
  }
  else {
    $file = 'absent'
    $cron = 'absent'
  }

  file { '/usr/local/bin/enforce-ssh-public-key-permissions.sh':
    ensure => $file, 
    source => 'puppet:///modules/stigs/redhat7/rhel_07_040410.sh',
    owner  => 'root',
    group  => 'root',
    mode   =>  '0750',
  }

  cron { 'STIG-ID: RHEL-07-040410':
    ensure  => $cron,
    command => '/usr/local/bin/enforce-ssh-public-key-permissions.sh',
    user    => 'root',
    hour    => 2,
    minute  => 32,
    require =>  File['/usr/local/bin/enforce-ssh-public-key-permissions.sh'],
  }

}

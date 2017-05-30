# STIG-ID: RHEL-07-040420
# Rule-ID: SV-86881r1_rule
# Vuln-ID: V-72257
# Severity: CAT I1
# Class: Unclass

class stigs::redhat7::authentication::ssh::rhel_07_040420 inherits stigs::redhat7::redhat7 {
  
  if $rhel_07_040420 == 'present' {
    $file = 'file'
    $cron = 'present'
  }
  else {
    $file = 'absent'
    $cron = 'absent'
  }

  file { '/usr/local/bin/enforce-ssh-private-key-permissions.sh':
    ensure => $file, 
    source => 'puppet:///modules/stigs/redhat7/rhel_07_040420.sh',
    owner  => 'root',
    group  => 'root',
    mode   =>  '0750',
  }

  cron { 'STIG-ID: RHEL-07-040420':
    ensure  => $cron,
    command => '/usr/local/bin/enforce-ssh-private-key-permissions.sh',
    user    => 'root',
    hour    => 2,
    minute  => 33,
    require =>  File['/usr/local/bin/enforce-ssh-private-key-permissions.sh'],
  }

}

# STIG-ID: RHEL-07-040540
# Rule-ID: SV-86901r1_rule
# Vuln-ID: V-72277
# Severity: CAT 1
# Class: Unclass

class stigs::redhat7::authentication::ssh::rhel_07_040540 inherits stigs::redhat7::redhat7 {
  
  if $rhel_07_040540 == 'present' {
    $file = 'file'
    $cron = 'present'
  }
  else {
    $file = 'absent'
    $cron = 'absent'
  }

  file { '/usr/local/bin/enforce-no-shosts.sh':
    ensure => $file, 
    source => 'puppet:///modules/stigs/redhat7/rhel_07_040540.sh',
    owner  => 'root',
    group  => 'root',
    mode   =>  '0750',
  }

  cron { 'STIG-ID: RHEL-07-040540':
    ensure  => $cron,
    command => '/usr/local/bin/enforce-no-shosts.sh',
    user    => 'root',
    hour    => 2,
    minute  => 27,
    require =>  File['/usr/local/bin/enforce-no-shosts.sh'],
  }

}

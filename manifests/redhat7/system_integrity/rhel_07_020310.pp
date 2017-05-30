# STIG-ID: RHEL-07-020310
# Rule-ID: SV-86629r1_rule
# Vuln-ID: V-72005
# Severity: CAT I
# Class: Unclass

class stigs::redhat7::system_integrity::rhel_07_020310 inherits stigs::redhat7::redhat7 {

  if $rhel_07_020310 == 'present' {
    $ensure = 'present'
    $file   = 'file'
    $cron   = 'present'
  }
  else {
    $ensure = 'absent'
    $file   = 'absent'
    $cron   = 'absent'
  }

  file { '/usr/local/bin/enforce-restricted-access.sh':
    ensure => $file,
    source => 'puppet:///modules/stigs/redhat7/rhel_07_020310.sh',
    owner  => 'root',
    group  => 'root',
    mode   => '0750',
  }

  cron { 'STIG-ID: RHEL-07-020310':
    ensure  => $cron,
    command => '/usr/local/bin/enforce-restricted-access.sh',
    user    => 'root',
    hour    => 2,
    minute  => 30,
    require =>  File['/usr/local/bin/enforce-restricted-access.sh'],
  }

}

# STIG-ID: RHEL-07-020320
# Rule-ID: SV-86631r1_rule
# Vuln-ID: V-72007
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::system_integrity::rhel_07_020320 inherits stigs::redhat7::redhat7 {

  if $rhel_07_020320 == 'present' {
    $file   = 'file'
    $cron   = 'present'
  }
  else {
    $file   = 'absent'
    $cron   = 'absent'
  }

  file { '/usr/local/bin/enforce-user-owner.sh':
    ensure => $file,
    source => 'puppet:///modules/stigs/redhat7/rhel_07_020320.sh',
    owner  => 'root',
    group  => 'root',
    mode   => '0750',
  }

  cron { 'STIG-ID: RHEL-07-020320':
    ensure  => $cron,
    command => '/usr/local/bin/enforce-user-owner.sh',
    user    => 'root',
    hour    => 2,
    minute  => 23,
    require =>  File['/usr/local/bin/enforce-user-owner.sh'],
  }

}

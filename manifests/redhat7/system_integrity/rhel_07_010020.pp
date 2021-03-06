# STIG-ID: RHEL-07-010020
# Rule-ID: SV-86479r2_rule
# Vuln-ID: V-71855
# Severity: CAT I
# Class: Unclass

class stigs::redhat7::system_integrity::rhel_07_010020 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010020 == 'present' {
    $file = 'file'
    $cron = 'present'
  }
  else {
    $file = 'absent'
    $cron = 'absent'
  }

  file { '/usr/local/bin/enforce-system-hashes.sh':
    ensure => $file,
    source => 'puppet:///modules/stigs/redhat7/rhel_07_010020.sh',
    owner  => 'root',
    group  => 'root',
    mode   =>  '0770',
  }

  cron { 'STIG-ID: RHEL-07-010020':
    ensure  => $cron,
    command => '/usr/local/bin/enforce-system-hashes.sh',
    user    => 'root',
    hour    => 2,
    minute  => 10,
    require =>  File['/usr/local/bin/enforce-system-hashes.sh'],
  }

}

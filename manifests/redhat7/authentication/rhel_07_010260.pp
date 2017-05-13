# STIG-ID: RHEL-07-010260
# Rule-ID: RHEL-07-010260_rule
# Vuln-ID: RHEL-07-010260
# Severity: CAT I
# Class: Unclass

class stigs::redhat7::authentication::rhel_07_010260 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010260 == 'present' {
    $ensure = 'present'
    $file   = 'file'
    $cron   = 'present'
  }
  else {
    $ensure = 'absent'
    $file   = 'absent'
    $cron   = 'absent'
  }

  file { '/usr/local/bin/enforce-nullok-removal.sh':
    ensure => $file,
    source => 'puppet:///modules/stigs/redhat7/rhel_07_010260.sh',
    owner  => 'root',
    group  => 'root',
    mode   => '0750',
  }

  cron { 'STIG-ID: RHEL-07-010260':
    ensure  => $cron,
    command => '/usr/local/bin/enforce-nullok-removal.sh',
    user    => 'root',
    hour    => 2,
    minute  => 22,
    require =>  File['/usr/local/bin/enforce-nullok-removal.sh'],
  }

}

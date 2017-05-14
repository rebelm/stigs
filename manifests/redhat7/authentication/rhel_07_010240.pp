# STIG-ID: RHEL-07-010240
# Rule-ID: SV-86551r1_rule
# Vuln-ID: V-71927
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::authentication::rhel_07_010240 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010240 == 'present' {
    $ensure = 'present'
    $file   = 'file'
    $cron   = 'present'
  }
  else {
    $ensure = 'absent'
    $file   = 'absent'
    $cron   = 'absent'
  }

  file { '/usr/local/bin/enforce-minimum-password-lifetime.sh':
    ensure => $file,
    source => 'puppet:///modules/stigs/redhat7/rhel_07_010240.sh',
    owner  => 'root',
    group  => 'root',
    mode   => '0750',
  }

  cron { 'STIG-ID: RHEL-07-010240':
    ensure  => $cron,
    command => '/usr/local/bin/enforce-minimum-password-lifetime.sh',
    user    => 'root',
    hour    => 2,
    minute  => 20,
    require =>  File['/usr/local/bin/enforce-minimum-password-lifetime.sh'],
  }

}

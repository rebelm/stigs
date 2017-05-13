# STIG-ID: RHEL-07-010230
# Rule-ID: RHEL-07-010230_rule
# Vuln-ID: RHEL-07-010230
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::authentication::rhel_07_010230 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010230 == 'present' {
    $ensure = 'present'
    $file   = 'file'
    $cron   = 'present'
  }
  else {
    $ensure = 'absent'
    $file   = 'absent'
    $cron   = 'absent'
  }

  file { '/usr/local/bin/enforce-maximum-password-lifetime.sh':
    ensure => $file,
    source => 'puppet:///modules/stigs/redhat7/rhel_07_010230.sh',
    owner  => 'root',
    group  => 'root',
    mode   => '0750',
  }

  cron { 'STIG-ID: RHEL-07-010230':
    ensure  => $cron,
    command => '/usr/local/bin/enforce-maximum-password-lifetime.sh',
    user    => 'root',
    hour    => 2,
    minute  => 21,
    require =>  File['/usr/local/bin/enforce-maximum-password-lifetime.sh'],
  }

}

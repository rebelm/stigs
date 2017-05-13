# STIG-ID: RHEL-07-010210
# Rule-ID: RHEL-07-010210_rule
# Vuln-ID: RHEL-07-010210
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::authentication::rhel_07_010210 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010210 == 'present' {
    $ensure = 'present'
    $file   = 'file'
    $cron   = 'present'
  }
  else {
    $ensure = 'absent'
    $file   = 'absent'
    $cron   = 'absent'
  }

  file { '/usr/local/bin/set-minimum-password-lifetime.sh':
    ensure => $file,
    source => 'puppet:///modules/stigs/redhat7/rhel_07_010210.sh',
    owner  => 'root',
    group  => 'root',
    mode   => '0750',
  }

  cron { 'STIG-ID: RHEL-07-010210':
    ensure  => $cron,
    command => '/usr/local/bin/set-minimum-password-lifetime.sh',
    user    => 'root',
    hour    => 2,
    minute  => 10,
    require =>  File['/usr/local/bin/set-minimum-password-lifetime.sh'],
  }

}

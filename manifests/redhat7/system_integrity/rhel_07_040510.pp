# STIG-ID: RHEL-07-040510
# Rule-ID: SV-86895r1_rule
# Vuln-ID: V-72271
# Severity: CAT I
# Class: Unclass

class stigs::redhat7::system_integrity::rhel_07_040510 inherits stigs::redhat7::redhat7 {

  if $rhel_07_040510 == 'present' {
    $ensure = 'present'
    $file   = 'file'
    $cron   = 'present'
  }
  else {
    $ensure = 'absent'
    $file   = 'absent'
    $cron   = 'absent'
  }

  file { '/usr/local/bin/enforce-firewall-dos-prevention.sh':
    ensure => $file,
    source => 'puppet:///modules/stigs/redhat7/rhel_07_040510.sh',
    owner  => 'root',
    group  => 'root',
    mode   => '0750',
  }

  cron { 'STIG-ID: RHEL-07-040510':
    ensure  => $cron,
    command => '/usr/local/bin/enforce-firewall-dos-prevention.sh',
    user    => 'root',
    hour    => 2,
    minute  => 52,
    require =>  File['/usr/local/bin/enforce-firewall-dos-prevention.sh'],
  }

}

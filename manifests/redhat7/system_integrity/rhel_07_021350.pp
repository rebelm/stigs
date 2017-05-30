# STIG-ID: RHEL-07-021350
# Rule-ID: SV-86629r2_rule
# Vuln-ID: V-72005
# Severity: CAT 1
# Class: Unclass

class stigs::redhat7::system_integrity::rhel_07_021350 inherits stigs::redhat7::redhat7 {
  
  if $rhel_07_021350 == 'present' {
    $file = 'file'
    $cron = 'present'
    $package = 'installed'
  }
  else {
    $file = 'absent'
    $cron = 'absent'
    $package = 'purged'
  }

  package { 'dracut-fips':
    ensure => $package,
  }
  
  exec { '/usr/bin/dracut -f':
    refreshonly => 'true',
    subscribe   => Package['dracut-fips'],
  }

  exec { '/usr/local/bin/enforce-fips-compliance.sh':
    refreshonly => 'true',
    subscribe   => Package['dracut-fips'],
  }

  file { '/usr/local/bin/enforce-fips-compliance.sh':
    ensure => 'file',
    source => 'puppet:///modules/stigs/redhat7/rhel_07_021350.sh',
    owner  => 'root',
    group  => 'root',
    mode   => '0570',
    before => Exec['/usr/local/bin/enforce-fips-compliance.sh'],
  }

}

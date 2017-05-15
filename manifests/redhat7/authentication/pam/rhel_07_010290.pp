# STIG-ID: RHEL-07-010290
# Rule-ID: SV-86561r1_rule
# Vuln-ID: V-71937
# Severity: CAT 1
# Class: Unclass

class stigs::redhat7::authentication::pam::rhel_07_010290 inherits stigs::redhat7::redhat7 {
  
  if $rhel_07_010290 == 'present' {
    $file = 'file'
    $cron = 'present'
  }
  else {
    $file = 'absent'
    $cron = 'absent'
  }

  file { '/usr/local/bin/enforce-nullok-removal.sh':
    ensure => $file, 
    source => 'puppet:///modules/stigs/redhat7/rhel_07_010290.sh',
    owner  => 'root',
    group  => 'root',
    mode   =>  '0750',
  }

  cron { 'STIG-ID: RHEL-07-010290':
    ensure  => $cron,
    command => '/usr/local/bin/enforce-nullok-removal.sh',
    user    => 'root',
    hour    => 2,
    minute  => 0,
    require =>  File['/usr/local/bin/enforce-nullok-removal.sh'],
  }

}

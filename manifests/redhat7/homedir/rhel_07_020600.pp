# STIG-ID: RHEL-07-020600
# Rule-ID: SV-86635r1_rule
# Vuln-ID: V-72011
# Severity: CAT II 
# Class: Unclass

class stigs::redhat7::homedir::rhel_07_020600 inherits stigs::redhat7::redhat7 {
  
  if $rhel_07_020600 == 'present' {
    $file = 'file'
    $cron = 'present'
  }
  else {
    $file = 'absent'
    $cron = 'absent'
  }

  file { '/usr/local/bin/enforce-assigned-home-directory-usermod.sh':
    ensure => $file, 
    source => 'puppet:///modules/stigs/redhat7/rhel_07_020600.sh',
    owner  => 'root',
    group  => 'root',
    mode   =>  '0750',
  }

  cron { 'STIG-ID: RHEL-07-020600':
    ensure  => $cron,
    command => '/usr/local/bin/enforce-assigned-home-directory-usermod.sh',
    user    => 'root',
    hour    => 2,
    minute  => 35,
    require =>  File['/usr/local/bin/enforce-assigned-home-directory-usermod.sh'],
  }

}

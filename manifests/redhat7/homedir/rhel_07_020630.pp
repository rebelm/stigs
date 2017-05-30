# STIG-ID: RHEL-07-020630
# Rule-ID: SV-86641r1_rule
# Vuln-ID: V-72017
# Severity: CAT II 
# Class: Unclass

class stigs::redhat7::homedir::rhel_07_020630 inherits stigs::redhat7::redhat7 {
  
  if $rhel_07_020630 == 'present' {
    $file = 'file'
    $cron = 'present'
  }
  else {
    $file = 'absent'
    $cron = 'absent'
  }

  file { '/usr/local/bin/enforce-home-directory-permissions.sh':
    ensure => $file, 
    source => 'puppet:///modules/stigs/redhat7/rhel_07_020630.sh',
    owner  => 'root',
    group  => 'root',
    mode   =>  '0750',
  }

  cron { 'STIG-ID: RHEL-07-020630':
    ensure  => $cron,
    command => '/usr/local/bin/enforce-home-directory-permissions.sh',
    user    => 'root',
    hour    => 2,
    minute  => 37,
    require =>  File['/usr/local/bin/enforce-home-directory-permissions.sh'],
  }

}

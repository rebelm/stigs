# STIG-ID: RHEL-07-020680
# Rule-ID: SV-86651r1_rule
# Vuln-ID: V-72027
# Severity: CAT II 
# Class: Unclass

class stigs::redhat7::homedir::rhel_07_020680 inherits stigs::redhat7::redhat7 {
  
  if $rhel_07_020680 == 'present' {
    $file = 'file'
    $cron = 'present'
  }
  else {
    $file = 'absent'
    $cron = 'absent'
  }

  file { '/usr/local/bin/enforce-home-directory-restrictive-recursive.sh':
    ensure => $file, 
    source => 'puppet:///modules/stigs/redhat7/rhel_07_020680.sh',
    owner  => 'root',
    group  => 'root',
    mode   =>  '0750',
  }

  cron { 'STIG-ID: RHEL-07-020680':
    ensure  => $cron,
    command => '/usr/local/bin/enforce-home-directory-restrictive-recursive.sh',
    user    => 'root',
    hour    => 2,
    minute  => 45,
    require =>  File['/usr/local/bin/enforce-home-directory-restrictive-recursive.sh'],
  }

}

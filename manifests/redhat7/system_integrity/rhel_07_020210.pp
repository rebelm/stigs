# STIG-ID: RHEL-07-020210
# Rule-ID: SV-86613r2_rule
# Vuln-ID: V-71989
# Severity: CAT I
# Class: Unclass

class stigs::redhat7::system_integrity::rhel_07_020210 inherits stigs::redhat7::redhat7 {

  if $rhel_07_020210 == 'present' {
    $file = 'file'
    $ensure = 'present'
    
    exec { '/usr/local/bin/enforce-selinux.sh':
      onlyif  => '/usr/bin/test `if [[ $(getenforce) == "Enforcing" ]]; then exit 1; else exit 0; fi`',
      require => File['/usr/local/bin/enforce-selinux.sh'],
    }

    file_line { 'System_Integrity-selinux':
      ensure            => $ensure,
      line              => 'SELINUX=enforcing',
      path              => '/etc/selinux/config',
      match             => '^SELINUX=',
      replace           => 'true',
      match_for_absence => 'false',
    }

  }
  else {
    $file = 'absent'
    $ensure = 'absent'
  }

  file { '/usr/local/bin/enforce-selinux.sh':
    ensure => $file, 
    owner  => 'root',
    group  => 'root',
    mode   =>  '0750',
    source => 'puppet:///modules/stigs/redhat7/rhel_07_010290.sh', 
  }

}

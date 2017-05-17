# STIG-ID: RHEL-07-010340
# Rule-ID: SV-86571r1_rule
# Vuln-ID: V-71947
# Severity: CAT
# Class: Unclass

class stigs::redhat7::authentication::sudo::rhel_07_010340 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010340 == 'present' {
    $file = 'file'
  }
  else {
    $file = 'absent'
  }

  file { '/usr/local/bin/enforce-reauthentication-sudo-nopasswd.sh':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0750',
    source => 'puppet:///modules/stigs/redhat7/rhel_07_010340.sh',
  }

  exec { '/usr/local/bin/enforce-reauthentication-sudo-nopasswd.sh':
    onlyif => "/bin/grep '^[^#].*NOPASSWD.*' /etc/sudoers /etc/sudoers.d/*"
  }

}

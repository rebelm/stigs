# STIG-ID: RHEL-07-010350
# Rule-ID: SV-86573r1_rule
# Vuln-ID: V-71949
# Severity: CAT
# Class: Unclass

class stigs::redhat7::authentication::sudo::rhel_07_010350 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010350 == 'present' {
    $file = 'file'
  }
  else {
    $file = 'absent'
  }

  file { '/usr/local/bin/enforce-reauthentication-sudo-authenticate.sh':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0750',
    source => 'puppet:///modules/stigs/redhat7/rhel_07_010350.sh',
  }

  exec { '/usr/local/bin/enforce-reauthentication-sudo-authenticate.sh':
    onlyif => "/bin/grep '^[^#].*!authenticate.*' /etc/sudoers /etc/sudoers.d/*"
  }

}

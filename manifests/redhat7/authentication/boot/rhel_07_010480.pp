# STIG-ID: RHEL-07-010480
# Rule-ID: SV-86585r1_rule
# Vuln-ID: V-71961
# Severity: CAT I
# Class: Unclass

# WARNING: This manifest requires that you create a password with the
# grub2-setpassword command, and store the values in a file at
# puppet:///modules/stigs/redhat7/user.cfg

class stigs::redhat7::authentication::boot::rhel_07_010480 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010480 == 'present' {
    $file = 'file'
  }
  else {
    $file = 'absent'
  }

  file { '/boot/grub2/user.cfg':
    ensure => $file,
    owner  => 'root',
    group  => 'root',
    mode   => '0600',
    source => 'puppet:///modules/stigs/redhat7/user.cfg',
  }

  
}

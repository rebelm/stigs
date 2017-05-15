# STIG-ID: RHEL-07-010280
# Rule-ID: Sv-86559r1_rule
# Vuln-ID: V-71935
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::authentication::pwquality::rhel_07_010280 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010280 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Password-minlen':
    ensure  => $ensure,
    line    => 'minlen = 15',
    path    => '/etc/security/pwquality.conf', 
    match   => '^minlen',
    replace => 'true',
  }

}

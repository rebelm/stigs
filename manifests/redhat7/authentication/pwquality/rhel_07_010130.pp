# STIG-ID: RHEL-07-010130
# Rule-ID: SV-86529r2_rule
# Vuln-ID: V-71905
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::authentication::pwquality::rhel_07_010130 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010130 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Password-lcredit':
    ensure  => $ensure,
    line    => 'lcredit = -1',
    path    => '/etc/security/pwquality.conf', 
    match   => '^lcredit',
    replace => 'true',
  }

}

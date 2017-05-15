# STIG-ID: RHEL-07-010150
# Rule-ID: SV-86533r1_rule
# Vuln-ID: V-71909
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::authentication::pwquality::rhel_07_010150 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010150 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Password-ocredit':
    ensure  => $ensure,
    line    => 'ocredit = -1',
    path    => '/etc/security/pwquality.conf', 
    match   => '^ocredit',
    replace => 'true',
  }

}

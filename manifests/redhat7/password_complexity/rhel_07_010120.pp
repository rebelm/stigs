# STIG-ID: RHEL-07-010120
# Rule-ID: SV-86527r2_rule
# Vuln-ID: V-71903
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::password_complexity::rhel_07_010120 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010120 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Password-ucredit':
    ensure  => $ensure,
    line    => 'ucredit = -1',
    path    => '/etc/security/pwquality.conf', 
    match   => '^ucredit',
    replace => 'true',
  }

}

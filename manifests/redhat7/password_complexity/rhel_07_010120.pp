# STIG-ID: RHEL-07-010120
# Rule-ID: RHEL-07-010120_rule
# Vuln-ID: RHEL-07-010120
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::password_complexity::rhel_07_010120 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010120 == 'present' {
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

# STIG-ID: RHEL-07-010090
# Rule-ID: RHEL-07-010090_rule
# Vuln-ID: RHEL-07-010090
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::password_complexity::rhel_07_010090 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010090 == 'present' {
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

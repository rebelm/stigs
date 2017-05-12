# STIG-ID: RHEL-07-010100
# Rule-ID: RHEL-07-010100_rule
# Vuln-ID: RHEL-07-010100
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::password_complexity::rhel_07_010100 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010100 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Password-lcredit':
    ensure => $ensure,
    line   => 'lcredit = -1',
    path   => '/etc/security/pwquality.conf', 
  }

}

# STIG-ID: RHEL-07-010110
# Rule-ID: RHEL-07-010110_rule
# Vuln-ID: RHEL-07-010110
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::password_complexity::rhel_07_010110 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010110 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Password-dcredit':
    ensure => $ensure,
    line   => 'dcredit = -1',
    path   => '/etc/security/pwquality.conf', 
  }

}

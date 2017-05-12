# STIG-ID: RHEL-07-010160
# Rule-ID: RHEL-07-010160_rule
# Vuln-ID: RHEL-07-010160
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::password_complexity::rhel_07_010160 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010160 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Password-maxclassrepeat':
    ensure => $ensure,
    line   => 'maxclassrepeat = 4',
    path   => '/etc/security/pwquality.conf', 
  }

}

# STIG-ID: RHEL-07-010150
# Rule-ID: RHEL-07-010150_rule
# Vuln-ID: RHEL-07-010150
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::password_complexity::rhel_07_010150 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010150 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Password-maxrepeat':
    ensure => $ensure,
    line   => 'maxrepeat = 2',
    path   => '/etc/security/pwquality.conf', 
  }

}

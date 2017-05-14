# STIG-ID: RHEL-07-010140
# Rule-ID: SV-86531r2_rule
# Vuln-ID: V-71907
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::password_complexity::rhel_07_010140 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010140 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Password-dcredit':
    ensure => $ensure,
    line   => 'dcredit = -1',
    path   => '/etc/security/pwquality.conf', 
    match  => '^dcredit',
    replace => 'true',
  }

}

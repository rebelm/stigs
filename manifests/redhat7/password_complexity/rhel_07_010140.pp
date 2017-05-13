# STIG-ID: RHEL-07-010140
# Rule-ID: RHEL-07-010140_rule
# Vuln-ID: RHEL-07-010140
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::password_complexity::rhel_07_010140 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010140 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Password-minclass':
    ensure  => $ensure,
    line    => 'minclass = 4',
    path    => '/etc/security/pwquality.conf', 
    match   => '^minclass',
    replace => 'true',
  }

}

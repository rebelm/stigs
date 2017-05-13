# STIG-ID: RHEL-07-010250
# Rule-ID: RHEL-07-010250_rule
# Vuln-ID: RHEL-07-010250
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::password_complexity::rhel_07_010250 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010250 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Password-minlen':
    ensure  => $ensure,
    line    => 'minlen = 15',
    path    => '/etc/security/pwquality.conf', 
    match   => '^minlen',
    replace => 'true',
  }

}

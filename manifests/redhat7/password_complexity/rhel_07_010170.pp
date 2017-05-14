# STIG-ID: RHEL-07-010170
# Rule-ID: SV-86537r1_rule
# Vuln-ID: V-71913
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::password_complexity::rhel_07_010170 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010170 == 'present' {
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

# STIG-ID: RHEL-07-010180
# Rule-ID: SV-86539r1_rule
# Vuln-ID: V-71915
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::password_complexity::rhel_07_010180 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010180 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Password-maxrepeat':
    ensure  => $ensure,
    line    => 'maxrepeat = 2',
    path    => '/etc/security/pwquality.conf', 
    match   => '^maxrepeat',
    replace => 'true',
  }

}

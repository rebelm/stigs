# STIG-ID: RHEL-07-010130
# Rule-ID: RHEL-07-010130_rule
# Vuln-ID: RHEL-07-010130
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::password_complexity::rhel_07_010130 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010130 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Password-difok':
    ensure  => $ensure,
    line    => 'difok = 8',
    path    => '/etc/security/pwquality.conf', 
    match   => '^difok',
    replace => 'true',
  }

}

# STIG-ID: RHEL-07-010160
# Rule-ID: SV-86535r1_rule
# Vuln-ID: V-71911
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::password_complexity::rhel_07_010160 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010160 == 'present' {
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

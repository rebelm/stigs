# STIG-ID: RHEL-07-010190
# Rule-ID: SV-86541r1_rule
# Vuln-ID: V-71917
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::authentication::pwquality::rhel_07_010190 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010190 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Password-maxclassrepeat':
    ensure  => $ensure,
    line    => 'maxclassrepeat = 4',
    path    => '/etc/security/pwquality.conf', 
    match   => '^maxclassrepeat',
    replace => 'true',
  }

}

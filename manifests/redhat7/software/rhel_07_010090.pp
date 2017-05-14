# STIG-ID: RHEL-07-010090
# Rule-ID: SV-86521r1_rule
# Vuln-ID: V-71897
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::software::rhel_07_010090 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010090 == 'present' {
    $package = 'installed'
  }
  else {
    $package = 'absent'
  }

  package { 'screen':
    ensure => $package,
  }


}

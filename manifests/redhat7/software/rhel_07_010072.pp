# STIG-ID: RHEL-07-010072
# Rule-ID: RHEL-07-010072_rule
# Vuln-ID: RHEL-07-010072
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::software::rhel_07_010072 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010072 == 'present' {
    $package = 'installed'
  }
  else {
    $package = 'absent'
  }

  package { 'screen':
    ensure => $package,
  }


}

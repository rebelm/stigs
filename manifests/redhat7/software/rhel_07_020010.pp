# STIG-ID: RHEL-07-020010
# Rule-ID: SV-86593r1_rule
# Vuln-ID: V-71969
# Severity: CAT I
# Class: Unclass

class stigs::redhat7::software::rhel_07_020010 inherits stigs::redhat7::redhat7 {

  # If this STIG is enforced, we want the package removed
  if $rhel_07_020010 == 'present' {
    $package = 'absent'
  }
  else {
    $package = 'present'
  }

  package { 'ypserv':
    ensure => $package,
  }


}

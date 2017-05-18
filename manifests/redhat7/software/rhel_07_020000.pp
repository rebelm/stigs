# STIG-ID: RHEL-07-020000
# Rule-ID: SV-86591r1_rule
# Vuln-ID: V-71967
# Severity: CAT I
# Class: Unclass

class stigs::redhat7::software::rhel_07_020000 inherits stigs::redhat7::redhat7 {

  # If this STIG is enforced, we want the package removed
  if $rhel_07_020000 == 'present' {
    $package = 'absent'
  }
  else {
    $package = 'present'
  }

  package { 'rsh-server':
    ensure => $package,
  }


}

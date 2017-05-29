# STIG-ID: RHEL-07-040700
# Rule-ID: SV-86925r1_rule
# Vuln-ID: V-72301
# Severity: CAT I
# Class: Unclass

class stigs::redhat7::software::rhel_07_040700 inherits stigs::redhat7::redhat7 {

  # If this STIG is enforced, we want the package removed
  if $rhel_07_040700 == 'present' {
    $package = 'absent'
  }
  else {
    $package = 'present'
  }

  package { 'tftp':
    ensure => $package,
  }


}

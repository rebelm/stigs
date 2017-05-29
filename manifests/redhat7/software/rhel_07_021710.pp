# STIG-ID: RHEL-07-021710
# Rule-ID: SV-86701r1_rule
# Vuln-ID: V-72077
# Severity: CAT I
# Class: Unclass

class stigs::redhat7::software::rhel_07_021710 inherits stigs::redhat7::redhat7 {

  # If this STIG is enforced, we want the package removed
  if $rhel_07_021710 == 'present' {
    $package = 'absent'
  }
  else {
    $package = 'present'
  }

  package { 'telnet-server':
    ensure => $package,
  }


}

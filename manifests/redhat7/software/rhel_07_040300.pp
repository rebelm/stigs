# STIG-ID: RHEL-07-040300
# Rule-ID: SV-86857r1_rule
# Vuln-ID: V-72233
# Severity: CAT I
# Class: Unclass

class stigs::redhat7::software::rhel_07_040300 inherits stigs::redhat7::redhat7 {

  # If this STIG is enforced, we want the package installed
  if $rhel_07_040300 == 'present' {
    $package = 'present'
  }
  else {
    $package = 'purged'
  }

  package { 'openssh-clients':
    ensure => $package,
  }
  package { 'openssh-server':
    ensure => $package,
  }


}

# STIG-ID: RHEL-07-040690
# Rule-ID: SV-86923r1_rule
# Vuln-ID: V-72299
# Severity: CAT I
# Class: Unclass

class stigs::redhat7::software::rhel_07_040690 inherits stigs::redhat7::redhat7 {

  # If this STIG is enforced, we want the package removed
  if $rhel_07_040690 == 'present' {
    $package = 'absent'
  }
  else {
    $package = 'present'
  }

  package { 'lftpd':
    ensure => $package,
  }


}

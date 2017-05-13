# STIG-ID: RHEL-07-010280
# Rule-ID: RHEL-07-010280_rule
# Vuln-ID: RHEL-07-010280
# Severity: CAT I
# Class: Unclass

class stigs::redhat7::authentication::rhel_07_010280 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010280 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Authentication-useradd-INACTIVE':
    ensure            => $ensure,
    line              => 'INACTIVE=0',
    path              => '/etc/default/useradd',
    match             => '^INACTIVE',
    replace           => 'true',
    match_for_absence => 'false',
  }

}

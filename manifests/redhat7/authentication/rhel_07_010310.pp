# STIG-ID: RHEL-07-010310
# Rule-ID: SV-86565r2_rule
# Vuln-ID: V-71941
# Severity: CAT I
# Class: Unclass

class stigs::redhat7::authentication::rhel_07_010310 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010310 == 'present' {
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
  }

}

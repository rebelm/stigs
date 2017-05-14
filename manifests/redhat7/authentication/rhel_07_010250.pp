# STIG-ID: RHEL-07-010250
# Rule-ID: SV-86553r1_rule
# Vuln-ID: V-71929
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::authentication::rhel_07_010250 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010250 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Authentication-login_defs-PASS_MAX_DAYS':
    ensure            => $ensure,
    line              => 'PASS_MAX_DAYS 60',
    path              => '/etc/login.defs',
    match             => '^PASS_MAX_DAYS',
    replace           => 'true',
    match_for_absence => 'false',
  }

}

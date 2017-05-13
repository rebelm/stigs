# STIG-ID: RHEL-07-010200
# Rule-ID: RHEL-07-010200_rule
# Vuln-ID: RHEL-07-010200
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::authentication::rhel_07_010200 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010200 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Authentication-login_defs-PASS_MIN_DAYS':
    ensure            => $ensure,
    line              => 'PASS_MIN_DAYS 1',
    path              => '/etc/login.defs',
    match             => '^PASS_MIN_DAYS',
    replace           => 'true',
    match_for_absence => 'false',
  }

}

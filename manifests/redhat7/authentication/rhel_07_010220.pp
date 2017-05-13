# STIG-ID: RHEL-07-010220
# Rule-ID: RHEL-07-010220_rule
# Vuln-ID: RHEL-07-010220
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::authentication::rhel_07_010220 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010220 == 'present' {
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

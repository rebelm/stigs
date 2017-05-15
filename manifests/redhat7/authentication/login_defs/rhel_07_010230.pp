# STIG-ID: RHEL-07-010230
# Rule-ID: SV-86549r1_rule
# Vuln-ID: V-71925
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::authentication::login_defs::rhel_07_010230 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010230 == 'present' {
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

# STIG-ID: RHEL-07-010430
# Rule-ID: SV-86575r1_rule
# Vuln-ID: V-71951
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::authentication::login_defs::rhel_07_010430 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010430 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Authentication-login_defs-FAIL_DELAY':
    ensure            => $ensure,
    line              => 'FAIL_DELAY 4',
    path              => '/etc/login.defs',
    match             => '^FAIL_DELAY',
    replace           => 'true',
    match_for_absence => 'false',
  }

}

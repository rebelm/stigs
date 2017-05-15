# STIG-ID: RHEL-07-010210
# Rule-ID: SV-86545r1_rule
# Vuln-ID: V-71921
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::authentication::login_defs::rhel_07_010210 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010210 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Authentication-login-defs_ENCRYPT_METHOD':
    ensure            => $ensure,
    line              => 'ENCRYPT_METHOD SHA512',
    path              => '/etc/login.defs',
    match             => '^ENCRYPT_METHOD',
    replace           => 'true',
    match_for_absence => 'false',
  }

}

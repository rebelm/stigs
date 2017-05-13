# STIG-ID: RHEL-07-010180
# Rule-ID: RHEL-07-010180_rule
# Vuln-ID: RHEL-07-010180
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::authentication::rhel_07_010180 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010180 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Authentication-login-defs_sha512':
    ensure            => $ensure,
    line              => 'ENCRYPT_METHOD SHA512',
    path              => '/etc/login.defs',
    match             => '^ENCRYPT_METHOD',
    replace           => 'true',
    match_for_absence => 'false',
  }

}

# STIG-ID: RHEL-07-010190
# Rule-ID: RHEL-07-010190_rule
# Vuln-ID: RHEL-07-010190
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::authentication::rhel_07_010190 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010190 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Authentication-libuser_sha512':
    ensure            => $ensure,
    line              => 'crypt_style = sha512',
    after             => '^\[defaults\]',
    path              => '/etc/libuser.conf',
    match             => '^crypt_style',
    replace           => 'true',
    match_for_absence => 'false',
  }

}

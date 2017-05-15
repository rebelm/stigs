# STIG-ID: RHEL-07-010220
# Rule-ID: SV-86547r2_rule
# Vuln-ID: V-71923
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::authentication::libuser::rhel_07_010220 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010220 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Authentication-libuser-crypt_style':
    ensure            => $ensure,
    line              => 'crypt_style = sha512',
    after             => '^\[defaults\]',
    path              => '/etc/libuser.conf',
    match             => '^crypt_style',
    replace           => 'true',
    match_for_absence => 'false',
  }

}

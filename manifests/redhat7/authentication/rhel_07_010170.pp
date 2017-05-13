# STIG-ID: RHEL-07-010170
# Rule-ID: RHEL-07-010170_rule
# Vuln-ID: RHEL-07-010170
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::authentication::rhel_07_010170 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010170 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Authentication-PAM_SHA512':
    ensure            => $ensure,
    line              => 'password    sufficient    pam_unix.so sha512',
    after             => '^password.*requisite.*pam_pwquality.so|^password',
    path              => '/etc/pam.d/system-auth', 
    match             => '^password.*sufficient.*pam_unix.so.*sha512',
    replace           => 'false',
    match_for_absence => 'true',
  }

}

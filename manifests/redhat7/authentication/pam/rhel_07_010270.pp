# STIG-ID: RHEL-07-010270
# Rule-ID: SV-86557r1_rule
# Vuln-ID: V-71933
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::authentication::pam::rhel_07_010270 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010270 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Authentication-PAM_remember':
    ensure            => $ensure,
    line              => 'password    sufficient    pam_unix.so sha512 shadow remember=5',
    after             => '^password.*requisite.*pam_pwquality.so|^password',
    path              => '/etc/pam.d/system-auth', 
    match             => '^password.*sufficient.*pam_unix.so.*sha512',
    replace           => 'true',
    multiple          => 'true',
    match_for_absence => 'false',
  }

}

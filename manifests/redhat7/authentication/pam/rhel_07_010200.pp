# STIG-ID: RHEL-07-010200
# Rule-ID: SV-86543r1_rule
# Vuln-ID: V-71919
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::authentication::pam::rhel_07_010200 inherits stigs::redhat7::redhat7 {

  # Stig rhel_07_010270 modifies the same exact file_line in the same file
  # This manfiest should naturally only run when stig rhel_07_010240 is absent
  if ($rhel_07_010200 == 'present') and ($rhel_07_010270 == 'absent') {
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
    match             => '^password.*sufficient.*pam_unix.so',
    replace           => 'true',
    multiple          => 'true',
    match_for_absence => 'false',
  }

}

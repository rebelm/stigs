# STIG-ID: RHEL-07-010170
# Rule-ID: RHEL-07-010170_rule
# Vuln-ID: RHEL-07-010170
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::authentication::rhel_07_010170 inherits stigs::redhat7::redhat7 {

  # Stig rhel_07_01024 modifies the same exact file_line in the same file
  # This manfiest should naturally only run when stig rhel_07_010240 is absent
  if ($rhel_07_010170 == 'present') and ($rhel_07_010240 == 'absent') {
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

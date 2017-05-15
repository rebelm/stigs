# STIG-ID: RHEL-07-010320
# Rule-ID: SV-86567r2_rule
# Vuln-ID: V-71943
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::authentication::rhel_07_010320 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010320 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  #  file_line { 'Authentication-PAM-faillock_required':
  #    ensure            => $ensure,
  #    line              => 'password    sufficient    pam_unix.so sha512 shadow remember=5',
  #    after             => '^password.*requisite.*pam_pwquality.so|^password',
  #    path              => '/etc/pam.d/system-auth', 
  #    match             => '^password.*sufficient.*pam_unix.so.*sha512',
  #    replace           => 'true',
  #    multiple          => 'true',
  #    match_for_absence => 'false',
  #  }

}

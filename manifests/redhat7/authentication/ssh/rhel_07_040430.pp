# STIG-ID: RHEL-07-040430
# Rule-ID: SV-86883r2_rule
# Vuln-ID: V-72259
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::authentication::ssh::rhel_07_040430 inherits stigs::redhat7::redhat7 {

  if $rhel_07_040430 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Authentication-sshd-GSSAPIAuthentication':
    ensure            => $ensure,
    line              => 'GSSAPIAuthentication no',
    path              => '/etc/ssh/sshd_config',
    match             => '^GSSAPIAuthentication',
    replace           => 'true',
    match_for_absence => 'false',
    multiple          => 'true',
  }

}

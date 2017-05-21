# STIG-ID: RHEL-07-040370
# Rule-ID: SV-86871r2_rule
# Vuln-ID: V-72247
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::authentication::ssh::rhel_07_040370 inherits stigs::redhat7::redhat7 {

  if $rhel_07_040370 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Authentication-sshd-PermitRootLogin':
    ensure            => $ensure,
    line              => 'PermitRootLogin no',
    path              => '/etc/ssh/sshd_config',
    match             => '^PermitRootLogin',
    replace           => 'true',
    match_for_absence => 'false',
    multiple          => 'true',
  }

}

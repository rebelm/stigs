# STIG-ID: RHEL-07-040470
# Rule-ID: SV-86891r2_rule
# Vuln-ID: V-72267
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::authentication::ssh::rhel_07_040470 inherits stigs::redhat7::redhat7 {

  if $rhel_07_040470 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Authentication-sshd-Compression':
    ensure            => $ensure,
    line              => 'Compression delayed',
    path              => '/etc/ssh/sshd_config',
    match             => '^Compression',
    replace           => 'true',
    match_for_absence => 'false',
    multiple          => 'true',
  }

}

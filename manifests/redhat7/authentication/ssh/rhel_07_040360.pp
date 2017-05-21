# STIG-ID: RHEL-07-040360
# Rule-ID: SV-86869r2_rule
# Vuln-ID: V-72245
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::authentication::ssh::rhel_07_040360 inherits stigs::redhat7::redhat7 {

  if $rhel_07_040360 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Authentication-sshd-PrintLastLog':
    ensure            => $ensure,
    line              => 'PrintLastLog yes',
    path              => '/etc/ssh/sshd_config',
    match             => '^PrintLastLog',
    replace           => 'true',
    match_for_absence => 'false',
    multiple          => 'true',
  }

}

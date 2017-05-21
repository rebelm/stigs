# STIG-ID: RHEL-07-040340
# Rule-ID: SV-86865r2_rule
# Vuln-ID: V-72241
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::authentication::ssh::rhel_07_040340 inherits stigs::redhat7::redhat7 {

  if $rhel_07_040340 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Authentication-sshd-ClientAliveCountMax':
    ensure            => $ensure,
    line              => 'ClientAliveCountMax 0',
    path              => '/etc/ssh/sshd_config',
    match             => '^ClientAliveCountMax',
    replace           => 'true',
    match_for_absence => 'false',
    multiple          => 'true',
  }

}

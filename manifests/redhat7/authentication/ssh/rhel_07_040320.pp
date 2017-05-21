# STIG-ID: RHEL-07-040320
# Rule-ID: SV-86861r2_rule
# Vuln-ID: V-72237
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::authentication::ssh::rhel_07_040320 inherits stigs::redhat7::redhat7 {

  if $rhel_07_040320 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Authentication-sshd-ClientAliveInterval':
    ensure            => $ensure,
    line              => 'ClientAliveInterval 600',
    path              => '/etc/ssh/sshd_config',
    match             => '^ClientAliveInterval',
    replace           => 'true',
    match_for_absence => 'false',
    multiple          => 'true',
  }

}

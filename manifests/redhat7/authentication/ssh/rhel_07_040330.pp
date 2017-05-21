# STIG-ID: RHEL-07-040330
# Rule-ID: SV-86861r2_rule
# Vuln-ID: V-72237
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::authentication::ssh::rhel_07_040330 inherits stigs::redhat7::redhat7 {

  if $rhel_07_040330 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Authentication-sshd-RhostsRSAAuthentication':
    ensure            => $ensure,
    line              => 'RhostsRSAAuthentication yes',
    path              => '/etc/ssh/sshd_config',
    match             => '^RhostsRSAAuthentication',
    replace           => 'true',
    match_for_absence => 'false',
    multiple          => 'true',
  }

}

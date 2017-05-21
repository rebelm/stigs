# STIG-ID: RHEL-07-040390
# Rule-ID: SV-86875r2_rule
# Vuln-ID: V-72251
# Severity: CAT I
# Class: Unclass

class stigs::redhat7::authentication::ssh::rhel_07_040390 inherits stigs::redhat7::redhat7 {

  if $rhel_07_040390 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Authentication-sshd-protocol':
    ensure            => $ensure,
    line              => 'Protocol 2',
    path              => '/etc/ssh/sshd_config',
    match             => '^Protocol',
    replace           => 'true',
    match_for_absence => 'false',
    multiple          => 'true',
  }

}

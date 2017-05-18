# STIG-ID: RHEL-07-010460
# Rule-ID: SV-86581r2_rule
# Vuln-ID: V-71957
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::authentication::ssh::rhel_07_010460 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010460 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Authentication-sshd-PermitUserEnvironment':
    ensure            => $ensure,
    line              => 'PermitUserEnvironment no',
    path              => '/etc/ssh/sshd_config',
    match             => 'PermitUserEnvironment',
    replace           => 'true',
    match_for_absence => 'false',
    multiple          => 'true',
  }

}

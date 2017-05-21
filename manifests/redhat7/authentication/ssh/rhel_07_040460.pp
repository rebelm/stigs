# STIG-ID: RHEL-07-040460
# Rule-ID: SV-86889r2_rule
# Vuln-ID: V-72265
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::authentication::ssh::rhel_07_040460 inherits stigs::redhat7::redhat7 {

  if $rhel_07_040460 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Authentication-sshd-UsePrivilegeSeparation':
    ensure            => $ensure,
    line              => 'UsePrivilegeSeparation sandbox', 
    path              => '/etc/ssh/sshd_config',
    match             => '^UsePrivilegeSeparation',
    replace           => 'true',
    match_for_absence => 'false',
    multiple          => 'true',
  }

}

# STIG-ID: RHEL-07-010470
# Rule-ID: SV-86583r2_rule
# Vuln-ID: V-71959
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::authentication::ssh::rhel_07_010470 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010470 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Authentication-sshd-HostbasedAuthentication':
    ensure            => $ensure,
    line              => 'HostbasedAuthentication no',
    path              => '/etc/ssh/sshd_config',
    match             => 'HostbasedAuthenticcation',
    replace           => 'true',
    match_for_absence => 'false',
    multiple          => 'true',
  }

}

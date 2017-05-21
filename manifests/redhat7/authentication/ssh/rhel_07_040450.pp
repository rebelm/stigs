# STIG-ID: RHEL-07-040450
# Rule-ID: SV-86887r2_rule
# Vuln-ID: V-72263
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::authentication::ssh::rhel_07_040450 inherits stigs::redhat7::redhat7 {

  if $rhel_07_040450 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Authentication-sshd-StrictModes':
    ensure            => $ensure,
    line              => 'StrictModes yes',
    path              => '/etc/ssh/sshd_config',
    match             => '^StrictModes',
    replace           => 'true',
    match_for_absence => 'false',
    multiple          => 'true',
  }

}

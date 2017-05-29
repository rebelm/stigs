# STIG-ID: RHEL-07-040710
# Rule-ID: SV-86927r2_rule
# Vuln-ID: V-72303
# Severity: CAT I
# Class: Unclass

class stigs::redhat7::authentication::ssh::rhel_07_040710 inherits stigs::redhat7::redhat7 {

  if $rhel_07_040710 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Authentication-sshd-X11Forwarding':
    ensure            => $ensure,
    line              => 'X11Fowarding yes',
    path              => '/etc/ssh/sshd_config',
    match             => '^X11Fowarding',
    replace           => 'true',
    match_for_absence => 'false',
    multiple          => 'true',
  }

}

# STIG-ID: RHEL-07-040400
# Rule-ID: SV-86877r2_rule
# Vuln-ID: V-72253
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::authentication::ssh::rhel_07_040400 inherits stigs::redhat7::redhat7 {

  if $rhel_07_040400 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Authentication-sshd-MACs':
    ensure            => $ensure,
    line              => 'MACs hmac-sha2-256,hmac-sha2-512',
    path              => '/etc/ssh/sshd_config',
    match             => '^MACs',
    replace           => 'true',
    match_for_absence => 'false',
    multiple          => 'true',
  }

}

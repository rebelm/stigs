# STIG-ID: RHEL-07-040350
# Rule-ID: SV-86867r2_rule
# Vuln-ID: V-72243
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::authentication::ssh::rhel_07_040350 inherits stigs::redhat7::redhat7 {

  if $rhel_07_040350 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Authentication-sshd-IgnoreRhosts':
    ensure            => $ensure,
    line              => 'IgnoreRhosts yes',
    path              => '/etc/ssh/sshd_config',
    match             => '^IgnoreRhosts',
    replace           => 'true',
    match_for_absence => 'false',
    multiple          => 'true',
  }

}

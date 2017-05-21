# STIG-ID: RHEL-07-040380
# Rule-ID: SV-86873r2_rule
# Vuln-ID: V-72249
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::authentication::ssh::rhel_07_040380 inherits stigs::redhat7::redhat7 {

  if $rhel_07_040380 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Authentication-sshd-IgnoreUserKnownHosts':
    ensure            => $ensure,
    line              => 'IgnoreUserKnownHosts yes',
    path              => '/etc/ssh/sshd_config',
    match             => '^IgnoreUserKnownHosts',
    replace           => 'true',
    match_for_absence => 'false',
    multiple          => 'true',
  }

}

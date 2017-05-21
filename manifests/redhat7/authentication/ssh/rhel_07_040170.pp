# STIG-ID: RHEL-07-040170
# Rule-ID: SV-86849r2_rule
# Vuln-ID: V-72225
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::authentication::ssh::rhel_07_040170 inherits stigs::redhat7::redhat7 {

  if $rhel_07_040170 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Authentication-sshd-banner':
    ensure            => $ensure,
    line              => 'banner=/etc/issue',
    path              => '/etc/ssh/sshd_config',
    match             => '^banner',
    replace           => 'true',
    match_for_absence => 'false',
    multiple          => 'true',
  }

}

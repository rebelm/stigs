# STIG-ID: RHEL-07-040160
# Rule-ID: SV-86847r2_rule
# Vuln-ID: V-72223
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::authentication::ssh::rhel_07_040160 inherits stigs::redhat7::redhat7 {

  if $rhel_07_040160 == 'present' {
    $ensure = 'present'
    $file = 'file'
  }
  else {
    $ensure = 'absent'
    $file = 'absent'
  }

  file_line { 'Authentication-sshd-TMOUT':
    ensure            => $ensure,
    line              => 'TMOUT=600',
    path              => '/etc/bashrc',
    match             => '^TMOUT',
    replace           => 'true',
    match_for_absence => 'false',
    multiple          => 'true',
  }

}

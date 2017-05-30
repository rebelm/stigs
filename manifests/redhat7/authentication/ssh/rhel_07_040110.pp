# STIG-ID: RHEL-07-040110
# Rule-ID: SV-86845r2_rule
# Vuln-ID: V-72221
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::authentication::ssh::rhel_07_040110 inherits stigs::redhat7::redhat7 {

  if $rhel_07_040110 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Authentication-sshd-Ciphers':
    ensure            => $ensure,
    line              => 'Ciphers aes128-ctr,aes192-ctr,aes256-ctr',
    path              => '/etc/ssh/sshd_config',
    match             => '^Ciphers',
    replace           => 'true',
    match_for_absence => 'false',
    multiple          => 'true',
  }

}

# STIG-ID: RHEL-07-040440
# Rule-ID: SV-86885r2_rule
# Vuln-ID: V-72261
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::authentication::ssh::rhel_07_040440 inherits stigs::redhat7::redhat7 {

  if $rhel_07_040440 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Authentication-sshd-KerberosAuthentication':
    ensure            => $ensure,
    line              => 'KerberosAuthentication no',
    path              => '/etc/ssh/sshd_config',
    match             => '^KerberosAuthentication',
    replace           => 'true',
    match_for_absence => 'false',
    multiple          => 'true',
  }

}

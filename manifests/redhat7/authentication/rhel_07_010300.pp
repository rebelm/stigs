# STIG-ID: RHEL-07-010300
# Rule-ID: SV-86563r2_rule
# Vuln-ID: V-71939
# Severity: CAT I
# Class: Unclass

class stigs::redhat7::authentication::rhel_07_010300 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010300 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Authentication-sshd-PermitEmptyPasswords':
    ensure            => $ensure,
    line              => 'PermitEmptyPasswords no',
    path              => '/etc/ssh/sshd_config',
    match             => 'PermitEmptyPasswords',
    replace           => 'true',
    match_for_absence => 'false',
    multiple          => 'true',
  }

}

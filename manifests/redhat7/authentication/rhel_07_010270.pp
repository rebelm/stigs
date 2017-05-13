# STIG-ID: RHEL-07-010270
# Rule-ID: RHEL-07-010270_rule
# Vuln-ID: RHEL-07-010270
# Severity: CAT I
# Class: Unclass

class stigs::redhat7::authentication::rhel_07_010270 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010270 == 'present' {
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

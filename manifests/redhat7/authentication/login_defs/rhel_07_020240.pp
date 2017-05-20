# STIG-ID: RHEL-07-020240
# Rule-ID: SV-86619r1_rule
# Vuln-ID: V-71955
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::authentication::login_defs::rhel_07_020240 inherits stigs::redhat7::redhat7 {

  if $rhel_07_020240 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Authentication-login_defs-UMASK':
    ensure            => $ensure,
    line              => 'UMASK 077',
    path              => '/etc/login.defs',
    match             => '^UMASK',
    replace           => 'true',
    match_for_absence => 'false',
  }

}

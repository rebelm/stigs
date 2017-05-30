# STIG-ID: RHEL-07-020610
# Rule-ID: SV-86637r1_rule
# Vuln-ID: V-72013
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::authentication::login_defs::rhel_07_020610 inherits stigs::redhat7::redhat7 {

  if $rhel_07_020610 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Authentication-login_defs-CREATE_HOME':
    ensure            => $ensure,
    line              => 'CREATE_HOME yes',
    path              => '/etc/login.defs',
    match             => '^CREATE_HOME',
    replace           => 'true',
    match_for_absence => 'false',
  }

}

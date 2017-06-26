# STIG-ID: RHEL-07-010082
# Rule-ID: SV-87809r2_rule
# Vuln-ID: V-73157
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::gnome::rhel_07_010082 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010082 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Gnome-session-lock_delay':
    ensure  => $ensure,
    line    => '/org/gnome/desktop/session/lock-delay',
    path    => '/etc/dconf/db/local.d/locks/session',
  }

}

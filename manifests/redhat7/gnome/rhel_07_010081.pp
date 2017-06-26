# STIG-ID: RHEL-07-010081
# Rule-ID: SV-87807r2_rule
# Vuln-ID: V-73155
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::gnome::rhel_07_010081 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010081 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Gnome-screensaver-lock_delay':
    ensure  => $ensure,
    line    => '/org/gnome/desktop/screensaver/lock-delay',
    path    => '/etc/dconf/db/local.d/locks/session',
  }

}

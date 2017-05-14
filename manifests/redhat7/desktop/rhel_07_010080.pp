# STIG-ID: RHEL-07-010080
# Rule-ID: SV-86519r3_rule
# Vuln-ID: V-71895
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::desktop::rhel_07_010080 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010080 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Session-Idle_Delay':
    ensure => $ensure,
    line   => '/org/gnome/desktop/session/idle-delay',
    path   => '/etc/dconf/db/local.d/locks/session', 
  }


}

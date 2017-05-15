# STIG-ID: RHEL-07-010070
# Rule-ID: SV-86517r2_rule
# Vuln-ID: V-71893
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::gnome::rhel_07_010070 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010070 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Gnome-Idle_Delay':
    ensure => $ensure,
    line   => 'idle-delay=uint32 900',
    path   => '/etc/dconf/db/local.d/00-screensaver', 
  }

}

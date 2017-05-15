# STIG-ID: RHEL-07-010100
# Rule-ID: SV-86523r1_rule
# Vuln-ID: V-71899
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::gnome::rhel_07_010100 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010100 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Gnome-Enable_Screensaver':
    ensure => $ensure,
    line   => 'idle-activation-enabled=true',
    path   => '/etc/dconf/db/local.d/00-screensaver', 
  }

}

# STIG-ID: RHEL-07-010073
# Rule-ID: RHEL-07-010073_rule
# Vuln-ID: RHEL-07-010073
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::desktop::rhel_07_010073 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010073 == 'present' {
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

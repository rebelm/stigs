# STIG-ID: RHEL-07-010070
# Rule-ID: RHEL-07-010070_rule
# Vuln-ID: RHEL-07-010070
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::desktop::rhel_07_010070 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010070 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Gnome-Lock_Delay':
    ensure => $ensure,
    line   => 'idle-delay=uint32 900',
    path   => '/etc/dconf/db/local.d/00-screensaver', 
  }

}

# STIG-ID: RHEL-07-010074
# Rule-ID: RHEL-07-010074_rule
# Vuln-ID: RHEL-07-010074
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::desktop::rhel_07_010074 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010074 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Gnome-Lock_Delay':
    ensure => $ensure,
    line   => 'lock-delay=uint32 5',
    path   => '/etc/dconf/db/local.d/00-screensaver', 
  }

}

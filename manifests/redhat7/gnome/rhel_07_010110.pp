# STIG-ID: RHEL-07-010110
# Rule-ID: SV-86525r1_rule
# Vuln-ID: V-71901
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::gnome::rhel_07_010110 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010110 == 'present' {
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

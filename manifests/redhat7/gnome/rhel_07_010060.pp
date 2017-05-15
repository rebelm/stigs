# STIG-ID: RHEL-07-010060
# Rule-ID: SV-86515r2_rule
# Vuln-ID: V-71891
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::gnome::rhel_07_010060 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010060 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Gnome-Lock_Enabled':
    ensure => $ensure,
    line   => 'lock-enabled=true',
    path   => '/etc/dconf/db/local.d/00-screensaver', 
  }

}

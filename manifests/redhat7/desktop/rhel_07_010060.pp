# STIG-ID: RHEL-07-010060
# Rule-ID: RHEL-07-010060_rule
# Vuln-ID: RHEL-07-010060
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::desktop::rhel_07_010060 inherits stigs::redhat7::redhat7 {

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

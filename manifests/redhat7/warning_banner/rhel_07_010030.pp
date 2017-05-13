# STIG-ID: RHEL-07-010030
# Rule-ID: SV-86483r2_rule
# Vuln-ID: V-71859
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::warning_banner::rhel_07_010030 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010030 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Gnome-Banner_Enabled':
    ensure => $ensure,
    line   => 'banner-message-enable=true',
    path   => '/etc/dconf/db/local.d/01-banner-message',
  }

}

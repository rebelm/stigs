# STIG-ID: RHEL-07-010450
# Rule-ID: SV-86579r2_rule
# Vuln-ID: V-71955
# Severity: CAT I
# Class: Unclass

class stigs::redhat7::gnome::rhel_07_010450 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010450 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Gnome-TimedLoginEnable-daemon':
    ensure => 'present',
    line   => '[daemon]',
    path   => '/etc/gdm/custom.conf',
  }
  ->
  file_line { 'Gnome-TimedLoginEnable':
    ensure  => $ensure,
    line    => 'TimedLoginEnable=false',
    after   => '^\[daemon\]',
    path    => '/etc/gdm/custom.conf',
    match   => '^TimedLoginEnable',
    replace => 'true',
  }

}

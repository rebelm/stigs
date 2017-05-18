# STIG-ID: RHEL-07-010440
# Rule-ID: SV-86577r1_rule
# Vuln-ID: V-71953
# Severity: CAT I
# Class: Unclass

class stigs::redhat7::gnome::rhel_07_010440 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010440 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Gnome-AutomaticLoginEnable-daemon':
    ensure => 'present',
    line   => '[daemon]',
    path   => '/etc/gdm/custom.conf',
  }
  ->
  file_line { 'Gnome-AutomaticLoginEnable':
    ensure  => $ensure,
    line    => 'AutomaticLoginEnable=false',
    after   => '^\[daemon\]',
    path    => '/etc/gdm/custom.conf',
    match   => '^AutomaticLoginEnable',
    replace => 'true',
  }

}

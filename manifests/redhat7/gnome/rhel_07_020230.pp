# STIG-ID: RHEL-07-020230
# Rule-ID: SV-86617r1_rule
# Vuln-ID: V-71993
# Severity: CAT I
# Class: Unclass

class stigs::redhat7::gnome::rhel_07_020230 inherits stigs::redhat7::redhat7 {

  if $rhel_07_020230 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Gnome-logout':
    ensure  => $ensure,
    line    => 'logout=’’',
    after   => '^\[org/gnome/settings-daemon/plugins/media-keys\]',
    path    => '/etc/dconf/db/local.d/00-disable-CAD',
    match   => '^logout',
    replace => 'true',
  }

}

# STIG-ID: RHEL-07-020050
# Rule-ID: SV-86601r1_rule
# Vuln-ID: V-71977
# Severity: CAT I
# Class: Unclass

class stigs::redhat7::system_integrity::rhel_07_020050 inherits stigs::redhat7::redhat7 {

  if $rhel_07_020050 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'yum-gpgcheck':
    ensure  => $ensure,
    line    => 'gpgcheck=1',
    after   => '^\[main\]',
    path    => '/etc/yum.conf',
    match   => '^gpgcheck',
    replace => 'true',
  }


}

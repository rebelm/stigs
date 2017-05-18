# STIG-ID: RHEL-07-020060
# Rule-ID: SV-86601r1_rule
# Vuln-ID: V-71977
# Severity: CAT I
# Class: Unclass

class stigs::redhat7::system_integrity::rhel_07_020060 inherits stigs::redhat7::redhat7 {

  if $rhel_07_020060 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'yum-localpkg_gpgcheck':
    ensure  => $ensure,
    line    => 'localpkg_gpgcheck=1',
    after   => '^\[main\]',
    path    => '/etc/yum.conf',
    match   => '^localpkg_gpgcheck',
    replace => 'true',
  }


}

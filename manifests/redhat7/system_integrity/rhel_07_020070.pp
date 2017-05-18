# STIG-ID: RHEL-07-020070
# Rule-ID: SV-86605r1_rule
# Vuln-ID: V-71981
# Severity: CAT I
# Class: Unclass

class stigs::redhat7::system_integrity::rhel_07_020070 inherits stigs::redhat7::redhat7 {

  if $rhel_07_020070 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'yum-repo_gpgcheck':
    ensure  => $ensure,
    line    => 'repo_gpgcheck=1',
    after   => '^\[main\]',
    path    => '/etc/yum.conf',
    match   => '^repo_gpgcheck',
    replace => 'true',
  }


}

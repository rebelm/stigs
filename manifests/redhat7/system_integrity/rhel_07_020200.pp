# STIG-ID: RHEL-07-020200
# Rule-ID: SV-86611r1_rule
# Vuln-ID: V-71987
# Severity: CAT III
# Class: Unclass

class stigs::redhat7::system_integrity::rhel_07_020200 inherits stigs::redhat7::redhat7 {

  if $rhel_07_020200 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'yum-clean_requirements_on_remove':
    ensure  => $ensure,
    line    => 'clean_requirements_on_remove=1',
    after   => '^\[main\]',
    path    => '/etc/yum.conf',
    match   => '^clean_requirements_on_remove',
    replace => 'true',
  }


}

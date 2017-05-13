# STIG-ID: RHEL-07-010050
# Rule-ID: SV-86485r2_rule
# Vuln-ID: V-71861
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::warning_banner::rhel_07_010050 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010050 == 'present' {
    $file = 'file'
  }
  else {
    $file = 'absent'
  }

  file { '/etc/issue':
    ensure => $file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/stigs/redhat7/rhel_07_010050.txt',
  }
                           

}

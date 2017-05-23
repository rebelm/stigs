# STIG-ID: RHEL-07-030850
# Rule-ID: SV-86817r2_rule
# Vuln-ID: V-72193
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::audit::rhel_07_030850 inherits stigs::redhat7::redhat7 {

  if $rhel_07_030850 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }
  
  file_line { 'Audit-rmmod':
    ensure => $ensure,
    line   => "-w /sbin/rmmod-p x -F auid!=4294967295 -k module-change",
    path   => '/etc/audit/rules.d/audit.rules',
  }

}

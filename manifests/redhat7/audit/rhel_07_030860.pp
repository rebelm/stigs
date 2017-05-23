# STIG-ID: RHEL-07-030860
# Rule-ID: SV-86819r2_rule
# Vuln-ID: V-72195
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::audit::rhel_07_030860 inherits stigs::redhat7::redhat7 {

  if $rhel_07_030860 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }
  
  file_line { 'Audit-modprobe':
    ensure => $ensure,
    line   => "-w /sbin/modprobe-p x -F auid!=4294967295 -k module-change",
    path   => '/etc/audit/rules.d/audit.rules',
  }

}

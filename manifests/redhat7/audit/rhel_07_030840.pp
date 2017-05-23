# STIG-ID: RHEL-07-030840
# Rule-ID: SV-86815r2_rule
# Vuln-ID: V-72191
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::audit::rhel_07_030840 inherits stigs::redhat7::redhat7 {

  if $rhel_07_030840 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }
  
  file_line { 'Audit-insmod':
    ensure => $ensure,
    line   => "-w /sbin/insmod -p x -F auid!=4294967295 -k module-change", 
    path   => '/etc/audit/rules.d/audit.rules',
  }

}

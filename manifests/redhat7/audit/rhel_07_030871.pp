# STIG-ID: RHEL-07-030871
# Rule-ID: SV-87817r2_rule
# Vuln-ID: V-73165
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::audit::rhel_07_030871 inherits stigs::redhat7::redhat7 {

  if $rhel_07_030871 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }
  
  file_line { 'Audit-etcgroup':
    ensure => $ensure,
    line   => "-w /etc/group -p wa -k identity", 
    path   => '/etc/audit/rules.d/audit.rules',
  }

}

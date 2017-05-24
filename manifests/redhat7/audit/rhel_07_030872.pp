# STIG-ID: RHEL-07-030872
# Rule-ID: SV-87819r2_rule
# Vuln-ID: V-73167
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::audit::rhel_07_030872 inherits stigs::redhat7::redhat7 {

  if $rhel_07_030872 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }
  
  file_line { 'Audit-etcgshadow':
    ensure => $ensure,
    line   => "-w /etc/gshadow -p wa -k identity", 
    path   => '/etc/audit/rules.d/audit.rules',
  }

}

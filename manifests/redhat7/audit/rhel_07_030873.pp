# STIG-ID: RHEL-07-030873
# Rule-ID: SV-87823r2_rule
# Vuln-ID: V-73171
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::audit::rhel_07_030873 inherits stigs::redhat7::redhat7 {

  if $rhel_07_030873 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }
  
  file_line { 'Audit-etcshadow':
    ensure => $ensure,
    line   => "-w /etc/shadow -p wa -k identity", 
    path   => '/etc/audit/rules.d/audit.rules',
  }

}

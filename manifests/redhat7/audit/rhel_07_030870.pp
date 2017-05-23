# STIG-ID: RHEL-07-030870
# Rule-ID: SV-86821r2_rule
# Vuln-ID: V-72197
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::audit::rhel_07_030870 inherits stigs::redhat7::redhat7 {

  if $rhel_07_030870 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }
  
  file_line { 'Audit-etcpasswd':
    ensure => $ensure,
    line   => "-w /etc/passwd -p wa -k identity", 
    path   => '/etc/audit/rules.d/audit.rules',
  }

}

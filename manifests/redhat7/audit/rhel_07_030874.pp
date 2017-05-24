# STIG-ID: RHEL-07-030874
# Rule-ID: SV-87825r2_rule
# Vuln-ID: V-73173
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::audit::rhel_07_030874 inherits stigs::redhat7::redhat7 {

  if $rhel_07_030874 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }
  
  file_line { 'Audit-etcopasswd':
    ensure => $ensure,
    line   => "-w /etc/opasswd -p wa -k identity", 
    path   => '/etc/audit/rules.d/audit.rules',
  }

}

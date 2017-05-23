# STIG-ID: RHEL-07-030630
# Rule-ID: SV-86773r3_rule
# Vuln-ID: V-72149
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::audit::rhel_07_030630 inherits stigs::redhat7::redhat7 {

  if $rhel_07_030630 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Audit-passwd':
    ensure => $ensure,
    line   => "-a always,exit -F path=/usr/bin/passwd -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged-passwd",
    path   => '/etc/audit/rules.d/audit.rules',
  }

}

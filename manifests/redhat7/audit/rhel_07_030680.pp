# STIG-ID: RHEL-07-030680
# Rule-ID: SV-86783r3_rule
# Vuln-ID: V-72159
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::audit::rhel_07_030680 inherits stigs::redhat7::redhat7 {

  if $rhel_07_030680 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Audit-su':
    ensure => $ensure,
    line   => "-a always,exit -F path=/bin/su -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged-priv_change",
    path   => '/etc/audit/rules.d/audit.rules',
  }

}

# STIG-ID: RHEL-07-030660
# Rule-ID: SV-86779r3_rule
# Vuln-ID: V-72155
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::audit::rhel_07_030660 inherits stigs::redhat7::redhat7 {

  if $rhel_07_030660 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Audit-chage':
    ensure => $ensure,
    line   => "-a always,exit -F path=/usr/bin/chage -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged-passwd",
    path   => '/etc/audit/rules.d/audit.rules',
  }

}

# STIG-ID: RHEL-07-030670
# Rule-ID: SV-86781r3_rule
# Vuln-ID: V-72157
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::audit::rhel_07_030670 inherits stigs::redhat7::redhat7 {

  if $rhel_07_030670 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Audit-userhelper':
    ensure => $ensure,
    line   => "-a always,exit -F path=/usr/sbin/userhelper -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged-passwd",
    path   => '/etc/audit/rules.d/audit.rules',
  }

}

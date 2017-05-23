# STIG-ID: RHEL-07-030770
# Rule-ID: SV-86801r3_rule
# Vuln-ID: V-72177
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::audit::rhel_07_030770 inherits stigs::redhat7::redhat7 {

  if $rhel_07_030770 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Audit-postqueue':
    ensure => $ensure,
    line   => "-a always,exit -F path=/usr/sbin/postqueue -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged-postfix",
    path   => '/etc/audit/rules.d/audit.rules',
  }

}

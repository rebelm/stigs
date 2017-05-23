# STIG-ID: RHEL-07-030760
# Rule-ID: SV-86799r3_rule
# Vuln-ID: V-72175
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::audit::rhel_07_030760 inherits stigs::redhat7::redhat7 {

  if $rhel_07_030760 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Audit-postdrop':
    ensure => $ensure,
    line   => "-a always,exit -F path=/usr/sbin/postdrop -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged-postfix",
    path   => '/etc/audit/rules.d/audit.rules',
  }

}

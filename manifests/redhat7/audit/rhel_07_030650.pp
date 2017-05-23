# STIG-ID: RHEL-07-030650
# Rule-ID: SV-86777r3_rule
# Vuln-ID: V-72153
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::audit::rhel_07_030650 inherits stigs::redhat7::redhat7 {

  if $rhel_07_030650 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Audit-gpasswd':
    ensure => $ensure,
    line   => "-a always,exit -F path=/usr/bin/gpasswd -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged-passwd",
    path   => '/etc/audit/rules.d/audit.rules',
  }

}

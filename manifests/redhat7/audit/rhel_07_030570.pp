# STIG-ID: RHEL-07-030570
# Rule-ID: SV-86761r3_rule
# Vuln-ID: V-72137
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::audit::rhel_07_030570 inherits stigs::redhat7::redhat7 {

  if $rhel_07_030570 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Audit-setsebool':
    ensure => $ensure,
    line   => "-a always,exit -F path=/usr/sbin/setsebool -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged-priv_change", 
    path   => '/etc/audit/rules.d/audit.rules',
  }

}

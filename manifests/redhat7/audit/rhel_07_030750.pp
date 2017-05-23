# STIG-ID: RHEL-07-030750
# Rule-ID: SV-86797r3_rule
# Vuln-ID: V-72173
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::audit::rhel_07_030750 inherits stigs::redhat7::redhat7 {

  if $rhel_07_030750 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Audit-umount':
    ensure => $ensure,
    line   => "-a always,exit -F path=/bin/umount -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged-mount",
    path   => '/etc/audit/rules.d/audit.rules',
  }

}

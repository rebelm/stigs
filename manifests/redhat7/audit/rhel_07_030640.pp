# STIG-ID: RHEL-07-030640
# Rule-ID: SV-86775r3_rule
# Vuln-ID: V-72151
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::audit::rhel_07_030640 inherits stigs::redhat7::redhat7 {

  if $rhel_07_030640 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Audit-unix_chkpwd':
    ensure => $ensure,
    line   => "-a always,exit -F path=/sbin/unix_chkpwd -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged-passwd",
    path   => '/etc/audit/rules.d/audit.rules',
  }

}

# STIG-ID: RHEL-07-030810
# Rule-ID: SV-86809r3_rule
# Vuln-ID: V-72185
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::audit::rhel_07_030810 inherits stigs::redhat7::redhat7 {

  if $rhel_07_030810 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Audit-pam_timestamp_check':
    ensure => $ensure,
    line   => "-a always,exit -F path=/sbin/pam_timestamp_check -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged-pam",
    path   => '/etc/audit/rules.d/audit.rules',
  }

}

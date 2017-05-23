# STIG-ID: RHEL-07-030730
# Rule-ID: SV-86793r3_rule
# Vuln-ID: V-72169
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::audit::rhel_07_030730 inherits stigs::redhat7::redhat7 {

  if $rhel_07_030730 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Audit-sudoedit':
    ensure => $ensure,
    line   => "-a always,exit -F path=/bin/sudoedit -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged-priv_change",
    path   => '/etc/audit/rules.d/audit.rules',
  }

}

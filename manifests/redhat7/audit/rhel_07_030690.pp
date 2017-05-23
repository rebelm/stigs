# STIG-ID: RHEL-07-030690
# Rule-ID: SV-86785r3_rule
# Vuln-ID: V-72161
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::audit::rhel_07_030690 inherits stigs::redhat7::redhat7 {

  if $rhel_07_030690 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Audit-sudo':
    ensure => $ensure,
    line   => "-a always,exit -F path=/usr/bin/sudo -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged-priv_change",
    path   => '/etc/audit/rules.d/audit.rules',
  }

}

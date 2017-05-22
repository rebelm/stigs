# STIG-ID: RHEL-07-030560
# Rule-ID: SV-86759r2_rule
# Vuln-ID: V-72135
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::audit::rhel_07_030560 inherits stigs::redhat7::redhat7 {

  if $rhel_07_030560 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Audit-semanage':
    ensure => $ensure,
    line   => "-a always,exit -F path=/usr/sbin/semanage -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged-priv_change",
    path   => '/etc/audit/rules.d/audit.rules',
  }

}

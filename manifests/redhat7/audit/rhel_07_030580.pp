# STIG-ID: RHEL-07-030580
# Rule-ID: SV-86763r3_rule
# Vuln-ID: V-72139
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::audit::rhel_07_030580 inherits stigs::redhat7::redhat7 {

  if $rhel_07_030580 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Audit-chcon':
    ensure => $ensure,
    line   => "-a always,exit -F path=/usr/sbin/chcon -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged-priv_change", 
    path   => '/etc/audit/rules.d/audit.rules',
  }

}

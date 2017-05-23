# STIG-ID: RHEL-07-030800
# Rule-ID: SV-86807r3_rule
# Vuln-ID: V-72183
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::audit::rhel_07_030800 inherits stigs::redhat7::redhat7 {

  if $rhel_07_030800 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Audit-crontab':
    ensure => $ensure,
    line   => "-a always,exit -F path=/usr/bin/crontab -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged_cron",
    path   => '/etc/audit/rules.d/audit.rules',
  }

}

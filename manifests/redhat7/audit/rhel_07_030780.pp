# STIG-ID: RHEL-07-030780
# Rule-ID: SV-86803r3_rule
# Vuln-ID: V-72179
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::audit::rhel_07_030780 inherits stigs::redhat7::redhat7 {

  if $rhel_07_030780 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Audit-ssh-keysign':
    ensure => $ensure,
    line   => "-a always,exit -F path=/usr/libexec/openssh/ssh-keysign -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged-ssh",
    path   => '/etc/audit/rules.d/audit.rules',
  }

}

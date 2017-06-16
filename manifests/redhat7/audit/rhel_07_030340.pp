# STIG-ID: RHEL-07-030340
# Rule-ID: SV-86715r1_rule
# Vuln-ID: V-72091
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::audit::rhel_07_030340 inherits stigs::redhat7::redhat7 {

  if $rhel_07_030340 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Audit-space_left_action':
    ensure => $ensure,
    line   => "space_left_action = email",
    path   => '/etc/audit/auditd.conf',
  }

}

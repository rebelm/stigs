# STIG-ID: RHEL-07-030330
# Rule-ID: SV-86713r1_rule
# Vuln-ID: V-72089
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::audit::rhel_07_030330 inherits stigs::redhat7::redhat7 {

  if $rhel_07_030330 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Audit-space_left':
    ensure => $ensure,
    line   => "space_left = 75",
    path   => '/etc/audit/auditd.conf',
  }

}

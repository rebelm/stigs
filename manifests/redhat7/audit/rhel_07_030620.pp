# STIG-ID: RHEL-07-030620
# Rule-ID: SV-86771r2_rule
# Vuln-ID: V-72147
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::audit::rhel_07_030620 inherits stigs::redhat7::redhat7 {

  if $rhel_07_030620 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Audit-lastlog':
    ensure => $ensure,
    line   => "-w /var/log/lastlog -p wa -k logins",
    path   => '/etc/audit/rules.d/audit.rules',
  }

}

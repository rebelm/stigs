# STIG-ID: RHEL-07-030610
# Rule-ID: SV-86769r2_rule
# Vuln-ID: V-72145
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::audit::rhel_07_030610 inherits stigs::redhat7::redhat7 {

  if $rhel_07_030610 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Audit-faillock':
    ensure => $ensure,
    line   => "-w /var/run/faillock -p wa -k logins",
    path   => '/etc/audit/rules.d/audit.rules',
  }

}

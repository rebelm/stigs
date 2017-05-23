# STIG-ID: RHEL-07-030700
# Rule-ID: SV-86787r2_rule
# Vuln-ID: V-72163
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::audit::rhel_07_030700 inherits stigs::redhat7::redhat7 {

  if $rhel_07_030700 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Audit-sudoers':
    ensure => $ensure,
    line   => "-w /etc/sudoers -p wa -k privileged-actions",
    path   => '/etc/audit/rules.d/audit.rules',
  }

  file_line { 'Audit-sudoers.d':
    ensure => $ensure,
    line   => "-w /etc/sudoers.d -p wa -k privileged-actions",
    path   => '/etc/audit/rules.d/audit.rules',
  }

}

# STIG-ID: RHEL-07-030600
# Rule-ID: SV-86767r3_rule
# Vuln-ID: V-72143
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::audit::rhel_07_030600 inherits stigs::redhat7::redhat7 {

  if $rhel_07_030600 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Audit-tallylog':
    ensure => $ensure,
    line   => "-w /var/log/tallylog -p wa -k logins",
    path   => '/etc/audit/rules.d/audit.rules',
  }

}

# STIG-ID: RHEL-07-030350
# Rule-ID: SV-86717r1_rule
# Vuln-ID: V-72093
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::audit::rhel_07_030350 inherits stigs::redhat7::redhat7 {

  if $rhel_07_030350 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Audit-action_mail_acct':
    ensure => $ensure,
    line   => "action_mail_acct = root",
    path   => '/etc/audit/auditd.conf',
  }

}

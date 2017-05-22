# STIG-ID: RHEL-07-030530
# Rule-ID: SV-86753r2_rule
# Vuln-ID: V-72129
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::audit::rhel_07_030530 inherits stigs::redhat7::redhat7 {

  if $rhel_07_030530 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  if $facts['os']['architecture'] == 'i386' {
    $arch = 'b32'
    $exit = 'EPERM'
  }
  else {
    $arch = 'b64'
    $exit = 'EACCESS'
  }
  
  file_line { 'Audit-open_by_handle_at':
    ensure => $ensure,
    line   => "-a always,exit -F arch=$arch -S open_by_handle_at -F exit=-$exit -F auid!=4294967295 -k access", 
    path   => '/etc/audit/rules.d/audit.rules',
  }

}

# STIG-ID: RHEL-07-030500
# Rule-ID: SV-86747r2_rule
# Vuln-ID: V-72123
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::audit::rhel_07_030500 inherits stigs::redhat7::redhat7 {

  if $rhel_07_030500 == 'present' {
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
  
  file_line { 'Audit-creat':
    ensure => $ensure,
    line   => "-a always,exit -F arch=$arch -S creat -F exit=-$exit -F auid!=4294967295 -k access", 
    path   => '/etc/audit/rules.d/audit.rules',
  }

}

# STIG-ID: RHEL-07-030550
# Rule-ID: SV-86757r2_rule
# Vuln-ID: V-72133
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::audit::rhel_07_030550 inherits stigs::redhat7::redhat7 {

  if $rhel_07_030550 == 'present' {
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
  
  file_line { 'Audit-ftruncate':
    ensure => $ensure,
    line   => "-a always,exit -F arch=$arch -S ftruncate -F exit=-$exit -F auid!=4294967295 -k access", 
    path   => '/etc/audit/rules.d/audit.rules',
  }

}

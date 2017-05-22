# STIG-ID: RHEL-07-030430
# Rule-ID: SV-86733r2_rule
# Vuln-ID: V-72109
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::audit::rhel_07_030430 inherits stigs::redhat7::redhat7 {

  if $rhel_07_030430 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  if $facts['os']['architecture'] == 'i386' {
    $arch = 'b32'
  }
  else {
    $arch = 'b64'
  }
  
  file_line { 'Audit-fchmodat':
    ensure => $ensure,
    line   => "-a always,exit -F arch=$arch -S fchmodat -F auid>=1000 -F auid!=4294967295 -k perm_mod", 
    path   => '/etc/audit/rules.d/audit.rules',
  }

}

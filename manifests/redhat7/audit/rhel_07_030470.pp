# STIG-ID: RHEL-07-030470
# Rule-ID: SV-86741r2_rule
# Vuln-ID: V-72117
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::audit::rhel_07_030470 inherits stigs::redhat7::redhat7 {

  if $rhel_07_030470 == 'present' {
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
  
  file_line { 'Audit-removexattr':
    ensure => $ensure,
    line   => "-a always,exit -F arch=$arch -S removexattr -F auid>=1000 -F auid!=4294967295 -k perm_mod", 
    path   => '/etc/audit/rules.d/audit.rules',
  }

}

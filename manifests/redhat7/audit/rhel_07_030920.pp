# STIG-ID: RHEL-07-030920
# Rule-ID: SV-86831r2_rule
# Vuln-ID: V-72207
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::audit::rhel_07_030920 inherits stigs::redhat7::redhat7 {

  if $rhel_07_030920 == 'present' {
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
  
  file_line { 'Audit-unlinkat':
    ensure => $ensure,
    line   => "-a always,exit -F arch=$arch -S unlinkat -F auid>=1000 -F auid!=4294967295 -k delete", 
    path   => '/etc/audit/rules.d/audit.rules',
  }

}

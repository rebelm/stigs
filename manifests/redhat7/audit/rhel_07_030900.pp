# STIG-ID: RHEL-07-030900
# Rule-ID: SV-86827r2_rule
# Vuln-ID: V-72203
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::audit::rhel_07_030900 inherits stigs::redhat7::redhat7 {

  if $rhel_07_030900 == 'present' {
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
  
  file_line { 'Audit-rmdir':
    ensure => $ensure,
    line   => "-a always,exit -F arch=$arch -S rmdir -F auid>=1000 -F auid!=4294967295 -k delete", 
    path   => '/etc/audit/rules.d/audit.rules',
  }

}

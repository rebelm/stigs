# STIG-ID: RHEL-07-030740
# Rule-ID: SV-86795r2_rule
# Vuln-ID: V-72171
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::audit::rhel_07_030740 inherits stigs::redhat7::redhat7 {

  if $rhel_07_030740 == 'present' {
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
  
  file_line { 'Audit-mount':
    ensure => $ensure,
    line   => "-a always,exit -F arch=$arch -S mount -F auid>=1000 -F auid!=4294967295 -k privileged-mount", 
    path   => '/etc/audit/rules.d/audit.rules',
  }

}

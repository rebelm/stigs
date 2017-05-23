# STIG-ID: RHEL-07-030880
# Rule-ID: SV-86823r2_rule
# Vuln-ID: V-72199
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::audit::rhel_07_030880 inherits stigs::redhat7::redhat7 {

  if $rhel_07_030880 == 'present' {
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
  
  file_line { 'Audit-rename':
    ensure => $ensure,
    line   => "-a always,exit -F arch=$arch -S rename -F auid>=1000 -F auid!=4294967295 -k delete", 
    path   => '/etc/audit/rules.d/audit.rules',
  }

}

# STIG-ID: RHEL-07-030830
# Rule-ID: SV-86813r2_rule
# Vuln-ID: V-72189
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::audit::rhel_07_030830 inherits stigs::redhat7::redhat7 {

  if $rhel_07_030830 == 'present' {
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
  
  file_line { 'Audit-delete_module':
    ensure => $ensure,
    line   => "-a always,exit -F arch=$arch -S delete_module -k module-change", 
    path   => '/etc/audit/rules.d/audit.rules',
  }

}

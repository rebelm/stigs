# STIG-ID: RHEL-07-030820
# Rule-ID: SV-86811r2_rule
# Vuln-ID: V-72187
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::audit::rhel_07_030820 inherits stigs::redhat7::redhat7 {

  if $rhel_07_030820 == 'present' {
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
  
  file_line { 'Audit-init_module':
    ensure => $ensure,
    line   => "-a always,exit -F arch=$arch -S init_module -k module-change", 
    path   => '/etc/audit/rules.d/audit.rules',
  }

}

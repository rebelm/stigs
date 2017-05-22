# STIG-ID: RHEL-07-030400
# Rule-ID: SV-86727r2_rule
# Vuln-ID: V-72103
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::audit::rhel_07_030400 inherits stigs::redhat7::redhat7 {

  if $rhel_07_030400 == 'present' {
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
  
  file_line { 'Audit-fchownat':
    ensure => $ensure,
    line   => "-a always,exit -F arch=$arch -S fchownat -F auid>=1000 -F auid!=4294967295 -k perm_mod", 
    path   => '/etc/audit/rules.d/audit.rules',
  }

}

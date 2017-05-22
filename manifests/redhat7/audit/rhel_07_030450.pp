# STIG-ID: RHEL-07-030450
# Rule-ID: SV-86737r2_rule
# Vuln-ID: V-72113
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::audit::rhel_07_030450 inherits stigs::redhat7::redhat7 {

  if $rhel_07_030450 == 'present' {
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
  
  file_line { 'Audit-fsetxattr':
    ensure => $ensure,
    line   => "-a always,exit -F arch=$arch -S fsetxattr -F auid>=1000 -F auid!=4294967295 -k perm_mod", 
    path   => '/etc/audit/rules.d/audit.rules',
  }

}

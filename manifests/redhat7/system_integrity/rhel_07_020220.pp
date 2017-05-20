# STIG-ID: RHEL-07-020220
# Rule-ID: SV-86615r2_rule
# Vuln-ID: V-71991
# Severity: CAT I
# Class: Unclass

class stigs::redhat7::system_integrity::rhel_07_020220 inherits stigs::redhat7::redhat7 {

  if $rhel_07_020220 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

    file_line { 'System_Integrity-SELINUXTYPE':
      ensure            => $ensure,
      line              => 'SELINUXTYPE=targeted',
      path              => '/etc/selinux/config',
      match             => '^SELINUXTYPE=',
      replace           => 'true',
      match_for_absence => 'false',
    }


}

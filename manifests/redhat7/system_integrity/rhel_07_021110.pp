# STIG-ID: RHEL-07-021110
# Rule-ID: SV-86677r1_rule
# Vuln-ID: V-72053
# Severity: CAT II
# Class: Unclass

# STIG-ID: RHEL-07-021120
# RULE-ID: SV-86679r1_rule
# Vuln-id: V-72053
# Severity: CAT II
# Class: Unclass

# WARNING. THIS STIG COVERS BOTH RHEL-07-021110 AND RHEL-07-021120
# THE FILE RHEL-07-021120.pp DOES NOT EXIST
class stigs::redhat7::system_integrity::rhel_07_021110 inherits stigs::redhat7::redhat7 {
  
  if $rhel_07_021110 == 'present' {
    $file = 'file'
    file { '/etc/cron.allow_user-owner':
      ensure => $file,
      owner  => 'root',
      group  => 'root',
      path   => '/etc/cron.allow',
    }
  }


}

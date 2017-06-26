# STIG-ID: RHEL-07-040310
# Rule-ID: SV-86859r2_rule
# Vuln-ID: V-72235
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::services::rhel_07_040310 inherits stigs::redhat7::redhat7 {

  # If this STIG is enforced, we want the service started, and enabled
  if $rhel_07_040310 == 'present' {
    
    service { 'sshd':
      ensure => 'running',
      enable => 'true',
    }

  }

}

# STIG-ID: RHEL-07-030000
# Rule-ID: SV-86703r1_rule
# Vuln-ID: V-72079
# Severity: CAT I
# Class: Unclass

class stigs::redhat7::services::rhel_07_030000 inherits stigs::redhat7::redhat7 {

  # If this STIG is enforced, we want the service started, and enabled
  if $rhel_07_030000 == 'present' {
    
    service { 'auditd':
      ensure => 'running',
      enable => 'true',
    }

  }

}

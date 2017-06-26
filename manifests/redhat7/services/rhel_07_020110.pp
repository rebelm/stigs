# STIG-ID: RHEL-07-020110
# Rule-ID: SV-86609r1_rule
# Vuln-ID: V-71985
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::services::rhel_07_020110 inherits stigs::redhat7::redhat7 {

  # If this STIG is enforced, we want the service stopped, and disabled
  if $rhel_07_020110 == 'present' {

    service { 'autofs':
      ensure => 'stopped',
      enable => 'false',
    }

  }

}

# STIG-ID: RHEL-07-021300
# Rule-ID: SV-86681r1_rule
# Vuln-ID: V-72057
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::services::rhel_07_021300 inherits stigs::redhat7::redhat7 {

# If this STIG is enforced, we want the service stopped, and disabled
if $rhel_07_021300 == 'present' {
  $enable = 'false'
  $service = 'stopped'

  service { 'kdump':
    ensure => $service,
    enable =>  $enable,
  }
}
   
}

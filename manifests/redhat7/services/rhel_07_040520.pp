# STIG-ID: RHEL-07-040520
# Rule-ID: SV-86897r1_rule
# Vuln-ID: V-72273
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::services::rhel_07_040520 inherits stigs::redhat7::redhat7 {

  # If this STIG is enforced, we want the service started, and enabled
  if $rhel_07_040520 == 'present' {
    $enable = 'true'
    $ensure = 'present'
    $service = 'running'
    $package = 'present'
    $file = 'file'

    package { 'firewalld':
      ensure => 'present',
    }

    service { 'firewalld':
      ensure => 'running',
      enable => 'true',
    }
  }

}

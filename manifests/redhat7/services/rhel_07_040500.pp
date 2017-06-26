# STIG-ID: RHEL-07-040500
# Rule-ID: SV-86893r2_rule
# Vuln-ID: V-72269
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::services::rhel_07_040500 inherits stigs::redhat7::redhat7 {

  # If this STIG is enforced, we want the service started, and enabled
  if $rhel_07_040500 == 'present' {
    $enable = 'true'
    $ensure = 'present'
    $service = 'running'
    $package = 'present'
    $file = 'file'

    package { 'ntp':
      ensure => $package,
    }
    ->
    file { '/etc/ntp.conf':
      ensure => $file,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
    }
    ->
    file_line { 'ntp-maxpoll':
      ensure  => $ensure,
      line    => 'maxpoll 10',
      path    => '/etc/ntp.conf',
      match   => '^maxpoll',
      replace => 'true',
    }
    service { 'ntpd':
      ensure    => $service,
      enable    => $enable,
      subscribe => File['/etc/ntp.conf'],
    }

  }

}

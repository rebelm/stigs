# STIG-ID: RHEL-07-040620
# Rule-ID: SV-86909r1_rule
# Vuln-ID: V-72285
# Severity: CAT II 
# Class: Unclass

class stigs::redhat7::kernel_parameter::rhel_07_040620 inherits stigs::redhat7::redhat7 {

  if $rhel_07_040620 == 'present' {
    $ensure = 'file'
  }
  else {
    $ensure = 'absent'
  }

  file { '/etc/sysctl.d/accept_source_route_default.conf':
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content =>  'net.ipv4.conf.default.accept_source_route = 0'
  }
}

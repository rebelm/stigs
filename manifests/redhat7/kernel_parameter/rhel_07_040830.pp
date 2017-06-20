# STIG-ID: RHEL-07-040830
# Rule-ID: SV-86943r1_rule
# Vuln-ID: V-72319
# Severity: CAT II 
# Class: Unclass

class stigs::redhat7::kernel_parameter::rhel_07_040830 inherits stigs::redhat7::redhat7 {

  if $rhel_07_040830 == 'present' {
    $ensure = 'file'
  }
  else {
    $ensure = 'absent'
  }

  file { '/etc/sysctl.d/ipv4_all_accept_source_route.conf':
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content =>  'net.ipv6.conf.all.accept_source_route = 0',
  }
}

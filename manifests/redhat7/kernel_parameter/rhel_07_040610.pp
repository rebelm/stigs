# STIG-ID: RHEL-07-040610
# Rule-ID: SV-86907r1_rule
# Vuln-ID: V-72283
# Severity: CAT II 
# Class: Unclass

class stigs::redhat7::kernel_parameter::rhel_07_040610 inherits stigs::redhat7::redhat7 {

  if $rhel_07_040610 == 'present' {
    $ensure = 'file'
  }
  else {
    $ensure = 'absent'
  }

  file { '/etc/sysctl.d/accept_source_route.conf':
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content =>  'net.ipv4.conf.all.accept_source_route = 0'
  }
}

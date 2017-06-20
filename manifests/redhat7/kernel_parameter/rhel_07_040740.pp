# STIG-ID: RHEL-07-040740
# Rule-ID: SV-86933r1_rule
# Vuln-ID: V-72309
# Severity: CAT II 
# Class: Unclass

class stigs::redhat7::kernel_parameter::rhel_07_040740 inherits stigs::redhat7::redhat7 {

  if $rhel_07_040740 == 'present' {
    $ensure = 'file'
  }
  else {
    $ensure = 'absent'
  }

  file { '/etc/sysctl.d/ip_forward.conf':
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content =>  'net.ipv4.ip_forward = 0',
  }
}

# STIG-ID: RHEL-07-040630
# Rule-ID: SV-86911r1_rule
# Vuln-ID: V-72287
# Severity: CAT II 
# Class: Unclass

class stigs::redhat7::kernel_parameter::rhel_07_040630 inherits stigs::redhat7::redhat7 {

  if $rhel_07_040630 == 'present' {
    $ensure = 'file'
  }
  else {
    $ensure = 'absent'
  }

  file { '/etc/sysctl.d/icmp_echo_ignore_broadcasts.conf':
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content =>  'net.ipv4.icmp_echo_ignore_broadcasts=1',
  }
}

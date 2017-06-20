# STIG-ID: RHEL-07-040650
# Rule-ID: SV-86915r2_rule
# Vuln-ID: V-72291
# Severity: CAT II 
# Class: Unclass

class stigs::redhat7::kernel_parameter::rhel_07_040650 inherits stigs::redhat7::redhat7 {

  if $rhel_07_040650 == 'present' {
    $ensure = 'file'
  }
  else {
    $ensure = 'absent'
  }

  file { '/etc/sysctl.d/default_send_redirects.conf':
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content =>  'net.ipv4.conf.default.send_redirects=0',
  }
}

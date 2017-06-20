# STIG-ID: RHEL-07-040640
# Rule-ID: SV-86913r2_rule
# Vuln-ID: V-72289
# Severity: CAT II 
# Class: Unclass

class stigs::redhat7::kernel_parameter::rhel_07_040640 inherits stigs::redhat7::redhat7 {

  if $rhel_07_040640 == 'present' {
    $ensure = 'file'
  }
  else {
    $ensure = 'absent'
  }

  file { '/etc/sysctl.d/default_accept_redirects.conf':
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content =>  'net.ipv4.conf.default.accept_redirects = 0',
  }
}

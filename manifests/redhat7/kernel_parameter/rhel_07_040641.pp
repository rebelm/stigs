# STIG-ID: RHEL-07-040641
# Rule-ID: SV-87827r2_rule
# Vuln-ID: V-73175
# Severity: CAT II 
# Class: Unclass

class stigs::redhat7::kernel_parameter::rhel_07_040641 inherits stigs::redhat7::redhat7 {

  if $rhel_07_040641 == 'present' {
    $ensure = 'file'
  }
  else {
    $ensure = 'absent'
  }

  file { '/etc/sysctl.d/all_accept_redirects.conf':
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content =>  'net.ipv4.conf.all.accept_redirects = 0',
  }
}

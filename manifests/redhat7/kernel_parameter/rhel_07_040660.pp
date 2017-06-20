# STIG-ID: RHEL-07-040660
# Rule-ID: SV-86917r2_rule
# Vuln-ID: V-72293
# Severity: CAT II 
# Class: Unclass

class stigs::redhat7::kernel_parameter::rhel_07_040660 inherits stigs::redhat7::redhat7 {

  if $rhel_07_040660 == 'present' {
    $ensure = 'file'
  }
  else {
    $ensure = 'absent'
  }

  file { '/etc/sysctl.d/all_send_redirects.conf':
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content =>  'net.ipv4.conf.all.send_redirects=0',
  }
}

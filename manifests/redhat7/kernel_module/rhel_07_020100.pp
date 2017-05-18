# STIG-ID: RHEL-07-020100
# Rule-ID: SV-86607r1_rule
# Vuln-ID: V-71983
# Severity: CAT II 
# Class: Unclass

class stigs::redhat7::kernel_module::rhel_07_020100 inherits stigs::redhat7::redhat7 {

  if $rhel_07_020100 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file { '/etc/modprobe.d/nousbstorage':
    ensure => $ensure,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  file_line { 'modprobe-nousbstorage':
    ensure  => $ensure,
    line    => 'install usb-storage /bin/true',
    path    => '/etc/modprobe.d/nousbstorage',
    require =>  File['/etc/modprobe.d/nousbstorage'],
  }


}

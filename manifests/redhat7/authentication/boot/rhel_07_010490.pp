# STIG-ID: RHEL-07-010490
# Rule-ID: SV-86587r1_rule
# Vuln-ID: V-71963
# Severity: CAT I
# Class: Unclass

# WARNING: This manifest requires that you create a password with the
# grub2-setpassword command, and store the values in a file at
# puppet:///modules/stigs/redhat7/user.cfg

class stigs::redhat7::authentication::boot::rhel_07_010490 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010490 == 'present' {
    $file = 'file'
  }
  else {
    $file = 'absent'
  }

  file { [ '/boot/efi',
           '/boot/efi/EFI',
           '/boot/efi/EFI/redhat', ]:
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0700',
    before =>  [ File['/boot/efi/EFI/redhat/user.cfg'], ],
  }

  file { '/boot/efi/EFI/redhat/user.cfg':
    ensure => $file,
    owner  => 'root',
    group  => 'root',
    mode   => '0600',
    source => 'puppet:///modules/stigs/redhat7/user.cfg',
  }

  
}

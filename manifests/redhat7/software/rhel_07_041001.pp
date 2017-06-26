# STIG-ID: RHEL-07-041001
# Rule-ID: SV-87041r2_rule
# Vuln-ID: V-72417
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::software::rhel_07_041001 inherits stigs::redhat7::redhat7 {

  if $rhel_07_041001 == 'present' {

    $packages = [ 'esc', 'pam_pkcs11', 'authconfig-gtk' ]
  
    $packages.each | String $package | {
      package { "$package":
        ensure => 'installed',
      }
    }

  }
  
}

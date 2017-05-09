# STIG-ID: RHEL-07-010030
# Rule-ID: RHEL-07-010030_rule
# Vuln-ID: RHEL-07-010030
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::warning_banner::rhel_07_010030 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010030 == 'present' {
    $file = 'file'
  }
  else {
    $file = 'absent'
  }

  $banner_enable = "[org/gnome/login-screen]\nbanner-message-enable=true"
  file { '/etc/dconf/db/local.d/01-banner-enable':
    ensure  => $file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => $banner_enable,
  }

 }

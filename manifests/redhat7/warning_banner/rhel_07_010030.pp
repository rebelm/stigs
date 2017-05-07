# STIG-ID: RHEL-07-010030
# Rule-ID: RHEL-07-010030_rule
# Vuln-ID: RHEL-07-010030
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::warning_banner::rhel_07_010030 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010030 == 'present' {
    $file = 'file'
    $directory = 'directory'
  }
  else {
    $file = 'absent'
    $directory = 'absent'
  }

  file { [ '/etc/dconf',
           '/etc/dconf/db',
           '/etc/dconf/db/local.d', ]:
    ensure =>  $directory,
    owner =>  'root',
    group =>  'root',
    mode =>  '0755',
  }

  $banner_setting = "[org/gnome/login-screen]\nbanner-message-enable=true"
  file { '/etc/dconf/db/local.d/01-banner-message':
    ensure  => $file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => $banner_setting,
    require => File['/etc/dconf/db/local.d/'],
  }

  file { '/etc/issue':
    ensure  => $file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source => 'puppet:///modules/stigs/redhat7/rhel_07_010030.txt',
  }

}

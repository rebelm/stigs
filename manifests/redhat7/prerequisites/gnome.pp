# The Gnome prerequisite ensures that the proper directories exist
# And that each configuration file is created, and ready for
# key/value pairs to be potentially added to the files

class stigs::redhat7::prerequisites::gnome inherits stigs::redhat7::redhat7 {

  file { [ '/etc/dconf',
           '/etc/dconf/db',
           '/etc/dconf/db/local.d', ]:
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
    before =>  [ File['/etc/dconf/db/local.d/00-screensaver'], 
                 File['/etc/dconf/db/local.d/01-banner'], ],
  }

  file { '/etc/dconf/db/local.d/00-screensaver':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    before =>  [ Class['stigs::redhat7::desktop::rhel_07_010060'],
                 Class['stigs::redhat7::desktop::rhel_07_010070'],
                 Class['stigs::redhat7::desktop::rhel_07_010074'], ],
  } ->
  file_line { 'Gnome-Screensaver':
    ensure  => 'present',
    line    => '[org/gnome/desktop/screensaver]',
    path    => '/etc/dconf/db/local.d/00-screensaver',
  }

  file { '/etc/dconf/db/local.d/01-banner':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    before =>  [ Class['stigs::redhat7::warning_banner::rhel_07_010030'],
                 Class['stigs::redhat7::warning_banner::rhel_07_010031'] ],
  } ->
  file_line { 'Gnome-Banner':
    ensure  => 'present',
    line    => '[org/gnome/login-screen]',
    path    => '/etc/dconf/db/local.d/01-banner',
  }
 
}

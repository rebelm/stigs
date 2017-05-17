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
                 File['/etc/dconf/db/local.d/01-banner-message'], ],
  }

  # Screensaver config file
  file { '/etc/dconf/db/local.d/00-screensaver':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    before =>  [ Class['stigs::redhat7::gnome::rhel_07_010060'],
                 Class['stigs::redhat7::gnome::rhel_07_010070'],
                 Class['stigs::redhat7::gnome::rhel_07_010100'],
                 Class['stigs::redhat7::gnome::rhel_07_010110'], ],
  } ->
  file_line { 'Gnome-Screensaver':
    ensure  => 'present',
    line    => '[org/gnome/gnome/screensaver]',
    path    => '/etc/dconf/db/local.d/00-screensaver',
  }

  # Banner config file
  file { '/etc/dconf/db/local.d/01-banner-message':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  } ->
  file_line { 'Gnome-Banner':
    ensure  => 'present',
    line    => '[org/gnome/login-screen]',
    path    => '/etc/dconf/db/local.d/01-banner-message',
    before  =>  [ Class['stigs::redhat7::gnome::rhel_07_010030'],
                  Class['stigs::redhat7::gnome::rhel_07_010040'], ],
  }

  # Session locks config file
  file { '/etc/dconf/db/local.d/locks':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  file { '/etc/dconf/db/local.d/locks/session':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '644',
    require => File['/etc/dconf/db/local.d/locks'],
    before  =>  [ Class['stigs::redhat7::gnome::rhel_07_010080'], ],
  }

  # custom.conf config file
  file { '/etc/gdm/custom.conf':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    before =>  [ Class['stigs::redhat7::gnome::rhel_07_010440'], ],
  }

 
}

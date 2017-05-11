# STIG-ID: RHEL-07-010071
# Rule-ID: RHEL-07-010071_rule
# Vuln-ID: RHEL-07-010071
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::desktop::rhel_07_010071 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010071 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Screensaver-Idle_Delay':
    ensure => $ensure,
    line   => '/org/gnome/desktop/screensaver/idle-delay',
    path   => '/etc/dconf/db/local.d/locks/session', 
  }

  file_line { 'Screensaver-Lock_Delay':
    ensure => $ensure,
    line   => '/org/gnome/desktop/screensaver/lock-delay',
    path   => '/etc/dconf/db/local.d/locks/session', 
  }

  file_line { 'Session-Idle_Delay':
    ensure => $ensure,
    line   => '/org/gnome/desktop/session/idle-delay',
    path   => '/etc/dconf/db/local.d/locks/session', 
  }


}

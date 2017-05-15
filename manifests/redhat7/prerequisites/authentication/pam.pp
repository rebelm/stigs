class stigs::redhat7::prerequisites::authentication::pam inherits stigs::redhat7::redhat7 {

   file { '/etc/pam.d/system-auth-ac':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }
  ->
  file { '/etc/pam.d/system-auth':
    ensure => 'link',
    target => '/etc/pam.d/system-auth-ac',
    before => [ Class['stigs::redhat7::authentication::pam::rhel_07_010200'],
                Class['stigs::redhat7::authentication::pam::rhel_07_010270'],
                Class['stigs::redhat7::authentication::pam::rhel_07_010290'], ],
  }

 file { '/etc/pam.d/password-auth-ac':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }
  ->
  file { '/etc/pam.d/password-auth':
    ensure => 'link',
    target => '/etc/pam.d/password-auth-ac',
  }


  file { '/usr/local/bin/puppetize-pam.sh':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0750',
    source => 'puppet:///modules/stigs/redhat7/puppetize-pam.sh',
  }
  ->
  exec { '/usr/local/bin/puppetize-pam.sh':
    unless => "/usr/bin/grep 'PUPPET MANAGED FILE' /etc/pam.d/system-auth",
    before =>  [ Class['stigs::redhat7::authentication::pam::rhel_07_010320'], ],
  }


}

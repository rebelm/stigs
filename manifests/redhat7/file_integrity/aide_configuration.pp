# This is a compound STIG solution as three stigs want to modify the same
# file lines

# I realized right after creating all the file_line resources that I could've
# built a hash and looped through them. woops.

# STIG-ID: RHEL-07-021600
# Rule-ID: SV-86693r2_rule
# Vuln-ID: V-72069
# Severity: CAT III
# Class: Unclass

# STIG-ID: RHEL-07-021610
# Rule-ID: SV-86695r2_rule
# Vuln-ID: V-72071
# Severity: CAT II
# Class: Unclass

# STIG-ID: RHEL-07-021620
# Rule-ID: SV-86693r2_rule
# Vuln-ID: V-72073
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::file_integrity::aide_configuration inherits stigs::redhat7::redhat7 {

  # If this STIG is enforced, we want the package installed
  # We must also ensure that an aide database is initialized. This will take a long time
  # on the first run
  if ($aide_configuration == 'present') and ($automated_aide == 'present'){

    file_line { 'aide_FIPSR': 
      ensure  => 'present',
      path    => '/etc/aide.conf',
      line    => 'FIPSR = p+i+n+u+g+s+m+c+acl+selinux+xattrs+sha512',
      match   => '^FIPSR',
      replace => 'true',
    }
  
    file_line {'aide_NORMAL':
      ensure => 'present',
      path  => '/etc/aide.conf',
      line  => 'NORMAL = sha512+acl+xattrs',
      match => '^NORMAL',
      replace => 'true',
    }
  
    file_line {'aide_DIR':
      ensure => 'present',
      path  => '/etc/aide.conf',
      line  => 'DIR = p+i+n+u+g+acl+selinux+xattrs+sha512',
      match => '^DIR',
      replace => 'true',
    }
  
    file_line {'aide_PERMS':
      ensure => 'present',
      path  => '/etc/aide.conf',
      line  => 'PERMS = p+u+g+acl+selinux+xattrs+sha512',
      match => '^PERMS',
      replace => 'true',
    }
  
    file_line {'aide_STATIC':
      ensure => 'present',
      path  => '/etc/aide.conf',
      line  => 'STATIC = p+u+g+acl+selinux+xattrs+i+n+b+c+ftype+sha512',
      match => '^STATIC',
      replace => 'true',
    }
  
    file_line {'aide_LOG':
      ensure => 'present',
      path  => '/etc/aide.conf',
      line  => 'LOG = p+u+g+n+acl+selinux+ftype+xattrs+sha512',
      match => '^LOG',
      replace => 'true',
    }
  
    file_line {'aide_CONTENT':
      ensure => 'present',
      path  => '/etc/aide.conf',
      line  => 'CONTENT = sha512+ftype+acl+xattrs',
      match => '^CONTENT ',
      replace => 'true',
    }
  
    file_line {'aide_CONTENT_EX':
      ensure => 'present',
      path  => '/etc/aide.conf',
      line  => 'CONTENT_EX = sha512+ftype+p+u+g+n+acl+selinux+xattrs',
      match => '^CONTENT_EX',
      replace => 'true',
    }
  
    file_line {'aide_DATAONLY':
      ensure => 'present',
      path  => '/etc/aide.conf',
      line  => 'DATAONLY = p+n+u+g+s+acl+selinux+xattrs+sha512',
      match => '^DATAONLY',
      replace => 'true',
    }

  }
  else {
    $ensure = 'absent'

  }

}

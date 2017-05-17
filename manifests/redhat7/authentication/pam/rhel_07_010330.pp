# STIG-ID: RHEL-07-010330
# Rule-ID: SV-86569r2_rule
# Vuln-ID: V-71945
# Severity: CAT II
# Class: Unclass

# Puppet manifests  rhel_07_010320 and rhel_07_010330 are ugly hacks to get the 
# expected behavior of turning each STIG on and off
# Example - turning the stig off would remove the pam_unix.so module, which means you
# essentially can't log into your machine. This is not the desired behavior. 
# As a result, This file is filled with ugly regular expressions.
# Attempt to understand at your own risk

class stigs::redhat7::authentication::pam::rhel_07_010330 inherits stigs::redhat7::redhat7 {

  if ($rhel_07_010330 == 'present') and ($rhel_07_010320 == 'absent') {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  if $ensure == 'present' {
    exec { '/usr/local/bin/purge-pam-faillock.sh':
      onlyif => "/bin/grep -A3 '^#Begin-auth'  /etc/pam.d/system-auth | tail -n1 | grep '^auth.*default=die.*pam_faillock.*authfail.*audit.*deny=3.*even_deny_root.*fail_interval=900'",
      before => [ File_line['Authentication-pam_system_auth-auth_required_faillock-fail_interval'], 
                  File_line['Authentication-pam_password_auth-auth_required_faillock-fail_interval'], ],
    }
  }

  file_line { 'Authentication-pam_system_auth-auth_required_faillock-fail_interval':
    ensure   => $ensure,
    line     => 'auth        required      pam_faillock.so preauth silent audit deny=3 even_deny_root fail_interval=900', 
    after    => 'Begin-auth',
    path     => '/etc/pam.d/system-auth', 
    match    => '^auth.*required.*faillock.*',
    replace  => 'true',
  }
  ->
  file_line { 'Authentication-pam_system_auth-auth_pam_unix-fail_interval':
    ensure   => 'present',
    line     => 'auth        sufficient    pam_unix.so try_first_pass', 
    after    => '^auth.*required.*pam_faillock|^auth',
    path     => '/etc/pam.d/system-auth', 
    match    => '^auth.*pam_unix.so',
    replace  => 'true',
  }
  ->
  file_line { 'Authentication-pam_system_auth-auth_die_faillock-fail_interval':
    ensure  => $ensure,
    line    => 'auth        [default=die] pam_faillock.so authfail audit deny=3 even_deny_root fail_interval=900',
    after   => '^auth.*sufficient.*pam_unix.so.*',
    path    => '/etc/pam.d/system-auth', 
    match   => '^auth.*default=die.*pam_unix.so',
    replace => 'true',
  }

  file_line { 'Authentication-pam_password_auth-auth_required_faillock-fail_interval':
    ensure   => $ensure,
    line     => 'auth        required      pam_faillock.so preauth silent audit deny=3 even_deny_root fail_interval=900', 
    after    => 'Begin-auth',
    path     => '/etc/pam.d/password-auth', 
    match    => '^auth.*required.*faillock.*',
    replace  => 'true',
  }
  ->
  file_line { 'Authentication-pam_password_auth-auth_pam_unix-fail_interval':
    ensure   => 'present',
    line     => 'auth        sufficient    pam_unix.so try_first_pass', 
    after    => '^auth.*required.*pam_faillock|^auth',
    path     => '/etc/pam.d/password-auth', 
    match    => '^auth.*pam_unix.so',
    replace  => 'true',
  }
  ->
  file_line { 'Authentication-pam_password_auth-auth_die_faillock-fail_interval':
    ensure  => $ensure,
    line    => 'auth        [default=die] pam_faillock.so authfail audit deny=3 even_deny_root fail_interval=900',
    after   => '^auth.*sufficient.*pam_unix.so.*',
    path    => '/etc/pam.d/password-auth', 
    match   => '^auth.*default=die.*pam_unix.so',
    replace => 'true',
  }

}

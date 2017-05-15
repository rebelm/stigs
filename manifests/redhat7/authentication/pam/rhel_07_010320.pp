# STIG-ID: RHEL-07-010320
# Rule-ID: SV-86567r2_rule
# Vuln-ID: V-71943
# Severity: CAT II
# Class: Unclass

# WARNING: 
# The resources will guarentee the three lines exist every time
# However The resources will only guarentee the three lines exist in the correct location when ran the first time
# This is because The file_line resouce appears incapable of 
# finding a regex in the 'match' and moving it to the 'after'
class stigs::redhat7::authentication::pam::rhel_07_010320 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010320 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'Authentication-pam_system_auth-auth_required_faillock':
    ensure   => $ensure,
    line     => 'auth        required      pam_faillock.so preauth silent audit deny=3 even_deny_root fail_interval=900 unlock_time=604800', 
    after    => 'Begin-auth',
    path     => '/etc/pam.d/system-auth', 
    match    => '^auth.*required.*faillock.*',
    replace  => 'true',
  }
  ->
  file_line { 'Authentication-pam_system_auth-auth_pam_unix':
    ensure   => 'present',
    line     => 'auth        sufficient    pam_unix.so try_first_pass', 
    after    => '^auth.*required.*pam_faillock',
    path     => '/etc/pam.d/system-auth', 
    match    => '^auth.*pam_unix.so',
    replace  => 'true',
  }
  ->
  file_line { 'Authentication-pam_system_auth-auth_die_faillock':
    ensure  => $ensure,
    line    => 'auth        [default=die] pam_faillock.so authfail audit deny=3 even_deny_root fail_interval=900 unlock_time=604800',
    after   => '^auth.*sufficient.*pam_unix.so.*',
    path    => '/etc/pam.d/system-auth', 
    match   => '^auth.*default=die.*pam_unix.so',
    replace => 'true',
  }

  file_line { 'Authentication-pam_password_auth-auth_required_faillock':
    ensure   => $ensure,
    line     => 'auth        required      pam_faillock.so preauth silent audit deny=3 even_deny_root fail_interval=900 unlock_time=604800', 
    after    => 'Begin-auth',
    path     => '/etc/pam.d/password-auth', 
    match    => '^auth.*required.*faillock.*',
    replace  => 'true',
  }
  ->
  file_line { 'Authentication-pam_password_auth-auth_pam_unix':
    ensure   => 'present',
    line     => 'auth        sufficient    pam_unix.so try_first_pass', 
    after    => '^auth.*required.*pam_faillock',
    path     => '/etc/pam.d/password-auth', 
    match    => '^auth.*pam_unix.so',
    replace  => 'true',
  }
  ->
  file_line { 'Authentication-pam_password_auth-auth_die_faillock':
    ensure  => $ensure,
    line    => 'auth        [default=die] pam_faillock.so authfail audit deny=3 even_deny_root fail_interval=900 unlock_time=604800',
    after   => '^auth.*sufficient.*pam_unix.so.*',
    path    => '/etc/pam.d/password-auth', 
    match   => '^auth.*default=die.*pam_unix.so',
    replace => 'true',
  }


}

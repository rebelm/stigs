# STIG-ID: RHEL-07-040000
# Rule-ID: SV-86841r1_rule
# Vuln-ID: V-72217
# Severity: CAT III
# Class: Unclass

class stigs::redhat7::system_integrity::rhel_07_040000 inherits stigs::redhat7::redhat7 {

  if $rhel_07_040000 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

    file_line { 'System_Integrity-maxlogins':
      ensure            => $ensure,
      line              => '* hard maxlogins 10',
      path              => '/etc/security/limits.conf',
      match             => '^\* hard maxlogins',
      replace           => 'true',
      match_for_absence => 'false',
    }


}

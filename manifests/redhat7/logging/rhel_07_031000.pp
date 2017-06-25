# STIG-ID: RHEL-07-031000
# Rule-ID: SV-86833r1_rule
# Vuln-ID: V-72209
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::logging::rhel_07_031000 inherits stigs::redhat7::redhat7 {

  if $rhel_07_031000 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  file_line { 'rsyslog_aggregation-server':
    ensure            => $ensure,
    line              => "*.*@@$log_aggregation_server:$log_server_port",
    path              => '/etc/rsyslog.conf',
    match             => '\*\.\* @@',
    replace           => 'true',
    match_for_absence => 'false',
    multiple          => 'true',
  }

}

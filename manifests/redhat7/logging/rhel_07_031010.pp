# STIG-ID: RHEL-07-031010
# Rule-ID: SV-86835r1_rule
# Vuln-ID: V-72211
# Severity: CAT II
# Class: Unclass

class stigs::redhat7::logging::rhel_07_031010 inherits stigs::redhat7::redhat7 {

  # If this STIG is enforced, we wan't to remove the line "$Modload imtcp"
  if ($rhel_07_031010 == 'present') and ( $facts['fqdn'] != $log_aggregation_server ){
    $ensure = 'absent'

    file_line { 'rsyslog_reject-log-messages':
      ensure            => $ensure,
      line              => '$ModLoad imtcp',
      path              => '/etc/rsyslog.conf',
      match             => '^\$ModLoad imtcp',
      replace           => 'true',
      match_for_absence => 'true',
      multiple          => 'true',
    }

  }

}

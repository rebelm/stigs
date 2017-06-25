# This is a compound STIG solution as two stigs want to modify the same
# Cron Entry

# STIG-ID: RHEL-07-020030
# Rule-ID: SV-86597r1_rule
# Vuln-ID: V-71973
# Severity: CAT II
# Class: Unclass

# STIG-ID: RHEL-07-020040
# Rule-ID: SV-86599r1_rule
# Vuln-ID: V-71975
# Severity: CAT II
# Class: Unclass


class stigs::redhat7::file_integrity::automated_aide inherits stigs::redhat7::redhat7 {

  # If this STIG is enforced, we want the package installed
  # We must also ensure that an aide database is initialized. This will take a long time
  # on the first run
  if $automated_aide == 'present' {
    $package = 'present'
    $ensure = 'present'

    package { 'aide':
      ensure => $package,
    }

    exec { 'Initialize-aide-database':
      path    => '/sbin',
      command => 'aide --init',
      creates => '/var/lib/aide/aide.db.new.gz',
      require =>  Package['aide'],
    }

    exec { 'Copy-aide-database':
      path        => '/bin',
      command     => 'cp /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz',
      subscribe   => Exec['Initialize-aide-database'],
      refreshonly => true,
    }

  }
  else {
    $ensure = 'absent'

  }

  # Run every Sunday at midnight
  cron { 'STIG-ID: RHEL-07-020040':
    ensure  => $ensure,
    command => "/usr/sbin/aide --check | /bin/mail -s \"\$HOSTNAME - Daily aide integrity check run\" $aide_email",
    user    => 'root',
    hour    => 0,
    minute  => 0,
    weekday => 0, 
  }


}

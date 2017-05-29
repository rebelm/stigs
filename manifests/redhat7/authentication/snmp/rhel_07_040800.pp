# STIG-ID: RHEL-07-040800
# Rule-ID: SV-86937r1_rule
# Vuln-ID: V-72313
# Severity: CAT I
# Class: Unclass

class stigs::redhat7::authentication::snmp::rhel_07_040800 inherits stigs::redhat7::redhat7 {

  if $rhel_07_040800 == 'present' {
    $file = 'file'
    
    exec { '/usr/local/bin/enforce-snmp-community-string.sh':
      onlyif  => '/usr/bin/egrep "public|private" /etc/snmp/snmpd.conf',
      require => File['/usr/local/bin/enforce-snmp-community-string.sh'],
    }

  }
  else {
    $file = 'absent'
  }

  file { '/usr/local/bin/enforce-snmp-community-string.sh':
    ensure => $file, 
    owner  => 'root',
    group  => 'root',
    mode   =>  '0750',
    source => 'puppet:///modules/stigs/redhat7/rhel_07_040800.sh', 
  }

}

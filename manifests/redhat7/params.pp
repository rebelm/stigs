# Available options are either 'present' or 'absent'
# 'present' means you will enforce the STIG on the system
# 'absent' means the STIG will not be enforced
#  Warning: setting a STIG value to 'absent' doesn't neccessarily mean
#  the opposite of applying the STIG, just that the STIG isn't being enforced
class stigs::redhat7::params (
  String $rhel_07_010010 = 'present',
  String $rhel_07_010020 = 'present',
  String $rhel_07_010030 = 'present',
  String $rhel_07_010040 = 'present',
  String $rhel_07_010050 = 'present',
  String $rhel_07_010060 = 'present',
  String $rhel_07_010070 = 'present',
  String $rhel_07_010080 = 'present',
  String $rhel_07_010090 = 'present',
  String $rhel_07_010100 = 'present',
  String $rhel_07_010110 = 'present',
  String $rhel_07_010120 = 'present',
  String $rhel_07_010130 = 'present',
  String $rhel_07_010140 = 'present',
  String $rhel_07_010150 = 'present',
  String $rhel_07_010160 = 'present',
  String $rhel_07_010170 = 'present',
  String $rhel_07_010180 = 'present',
  # rhel_07_010190 enable in production environment
  String $rhel_07_010190 = 'absent',
  String $rhel_07_010200 = 'present',
  String $rhel_07_010210 = 'present',
  String $rhel_07_010220 = 'present',
  String $rhel_07_010230 = 'present',
  # rhel_07_010240 should be turned off for testing
  String $rhel_07_010240 = 'absent',
  String $rhel_07_010250 = 'present',
  String $rhel_07_010260 = 'present',
  String $rhel_07_010270 = 'present',
  String $rhel_07_010280 = 'present',
  String $rhel_07_010290 = 'present',
  String $rhel_07_010300 = 'present',
  String $rhel_07_010310 = 'present',
  # rhel_07_010320 and rhel_07_010330 account lockout is too strict
  String $rhel_07_010320 = 'absent',
  String $rhel_07_010330 = 'absent',
  String $rhel_07_010340 = 'present',
  String $rhel_07_010350 = 'present',
  String $rhel_07_010430 = 'present',
  String $rhel_07_010440 = 'present',
  String $rhel_07_010450 = 'present',
  String $rhel_07_010460 = 'present',
  String $rhel_07_010470 = 'present',
  String $rhel_07_020000 = 'present',
  String $rhel_07_020010 = 'present',
  String $rhel_07_020050 = 'present',
  String $rhel_07_020060 = 'present',
  String $rhel_07_020070 = 'present',
  # rhel_07_010190 enable in production environment
  String $rhel_07_020100 = 'present',
  String $rhel_07_020110 = 'present',
  String $rhel_07_020200 = 'present',
  String $rhel_07_020210 = 'present',
){

}

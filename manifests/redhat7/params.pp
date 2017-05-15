# Available options are either 'present' or 'absent'
class stigs::redhat7::params (
  String $rhel_07_010010 = 'present',
  String $rhel_07_010020 = 'present',
  String $rhel_07_010030 = 'present',
  String $rhel_07_010040 = 'present',
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
  # rhel_07_010190 password requirement is too strict
  String $rhel_07_010190 = 'absent',
  String $rhel_07_010200 = 'present',
  String $rhel_07_010210 = 'present',
  String $rhel_07_010220 = 'present',
  String $rhel_07_010230 = 'present',
  String $rhel_07_010240 = 'present',
  String $rhel_07_010250 = 'present',
  String $rhel_07_010260 = 'present',
  String $rhel_07_010270 = 'present',
  String $rhel_07_010280 = 'present',
  String $rhel_07_010290 = 'present',
  String $rhel_07_010300 = 'present',
  String $rhel_07_010310 = 'present',
){

}


# NOTES

# STIGS rhel_07_010170 and rhel_07_010240 should not both be absent

# probably want to disable 010190
# make sure to modify prerequisite files as i go through conversion

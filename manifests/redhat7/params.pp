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
  
  # To use these two STIGS, you must create a grub password with
  # the grub2-setpassword command, and save that file as
  # puppet:///modules/stigs/files/redhat7/user.cfg
  String $rhel_07_010480 = 'present',
  String $rhel_07_010490 = 'present',


  String $rhel_07_020000 = 'present',
  String $rhel_07_020010 = 'present',
  String $rhel_07_020050 = 'present',
  String $rhel_07_020060 = 'present',
  # rhel_07_020070 stopped me from installing software completely
  # and packages are already ensured to be checked with GPG keys in 
  # STIG 020050. Find out how to adhere to this STIG as it is a CAT 1.
  String $rhel_07_020070 = 'absent',
  String $rhel_07_020100 = 'present',
  String $rhel_07_020110 = 'present',
  String $rhel_07_020200 = 'present',
  String $rhel_07_020210 = 'present',
  String $rhel_07_020220 = 'present',
  String $rhel_07_020230 = 'present',
  String $rhel_07_020240 = 'present',
  String $rhel_07_020320 = 'present',
  String $rhel_07_020330 = 'present',

  String $rhel_07_021710 = 'present',

  String $rhel_07_030000 = 'present',

  String $rhel_07_030370 = 'present',
  String $rhel_07_030380 = 'present',
  String $rhel_07_030390 = 'present',
  String $rhel_07_030400 = 'present',
  String $rhel_07_030410 = 'present',
  String $rhel_07_030420 = 'present',
  String $rhel_07_030430 = 'present',
  String $rhel_07_030440 = 'present',
  String $rhel_07_030450 = 'present',
  String $rhel_07_030460 = 'present',
  String $rhel_07_030470 = 'present',
  String $rhel_07_030480 = 'present',
  String $rhel_07_030490 = 'present',
  String $rhel_07_030500 = 'present',
  String $rhel_07_030510 = 'present',
  String $rhel_07_030520 = 'present',
  String $rhel_07_030530 = 'present',
  String $rhel_07_030540 = 'present',
  String $rhel_07_030550 = 'present',
  String $rhel_07_030560 = 'present',
  String $rhel_07_030570 = 'present',
  String $rhel_07_030580 = 'present',
  String $rhel_07_030590 = 'present',
  String $rhel_07_030600 = 'present',
  String $rhel_07_030610 = 'present',
  String $rhel_07_030620 = 'present',
  String $rhel_07_030630 = 'present',
  String $rhel_07_030640 = 'present',
  String $rhel_07_030650 = 'present',
  String $rhel_07_030660 = 'present',
  String $rhel_07_030670 = 'present',
  String $rhel_07_030680 = 'present',
  String $rhel_07_030690 = 'present',
  String $rhel_07_030700 = 'present',
  String $rhel_07_030710 = 'present',
  String $rhel_07_030720 = 'present',
  String $rhel_07_030730 = 'present',
  String $rhel_07_030740 = 'present',
  String $rhel_07_030750 = 'present',
  String $rhel_07_030760 = 'present',
  String $rhel_07_030770 = 'present',
  String $rhel_07_030780 = 'present',
  String $rhel_07_030790 = 'present',
  String $rhel_07_030800 = 'present',
  String $rhel_07_030810 = 'present',
  String $rhel_07_030820 = 'present',
  String $rhel_07_030830 = 'present',
  String $rhel_07_030840 = 'present',
  String $rhel_07_030850 = 'present',
  String $rhel_07_030860 = 'present',
  String $rhel_07_030870 = 'present',
  String $rhel_07_030871 = 'present',
  String $rhel_07_030872 = 'present',
  String $rhel_07_030873 = 'present',
  String $rhel_07_030874 = 'present',
  String $rhel_07_030880 = 'present',
  String $rhel_07_030890 = 'present',
  String $rhel_07_030900 = 'present',
  String $rhel_07_030910 = 'present',
  String $rhel_07_030920 = 'present',

  String $rhel_07_040170 = 'present',

  String $rhel_07_040300 = 'present',
  String $rhel_07_040310 = 'present',
  String $rhel_07_040320 = 'present',
  String $rhel_07_040330 = 'present',
  String $rhel_07_040340 = 'present',
  String $rhel_07_040350 = 'present',
  String $rhel_07_040360 = 'present',
  # Enable RHEL_07_040370 once you are confident in your
  # network SSH public key configurations
  # Disabling root SSH login without proper planning can be
  # disasterous
  String $rhel_07_040370 = 'absent',
  String $rhel_07_040380 = 'present',
  String $rhel_07_040390 = 'present',
  # STIGS rhel_07_040430 and rhel_07_040440 seem rediculous
  # The justification is "kerberos increases the attack vector"
  # Regardless, authentication is most secure, and conveinent with public keys
  String $rhel_07_040430 = 'present',
  String $rhel_07_040440 = 'present',
  String $rhel_07_040450 = 'present',
  String $rhel_07_040460 = 'present',
  String $rhel_07_040470 = 'present',
  String $rhel_07_040500 = 'present',
  String $rhel_07_040540 = 'present',
  String $rhel_07_040550 = 'present',

  String $rhel_07_040690 = 'present',
  String $rhel_07_040700 = 'present',
  String $rhel_07_040710 = 'present',

  String $rhel_07_040800 = 'present',



){

}

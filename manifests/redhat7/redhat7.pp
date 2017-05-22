# DO NOT MODIFY THIS FILE
# To turn off a STIG, modify the params.pp file
class stigs::redhat7::redhat7 inherits stigs::redhat7::params {

  include stigs::redhat7::prerequisites::authentication::login_defs
  include stigs::redhat7::prerequisites::authentication::pam
  include stigs::redhat7::prerequisites::authentication::libuser
  include stigs::redhat7::prerequisites::authentication::ssh
  include stigs::redhat7::prerequisites::authentication::pwquality
  include stigs::redhat7::prerequisites::gnome
  include stigs::redhat7::prerequisites::yum
  include stigs::redhat7::prerequisites::selinux
  include stigs::redhat7::prerequisites::audit

  include stigs::redhat7::system_integrity::rhel_07_010010
  include stigs::redhat7::system_integrity::rhel_07_010020

  include stigs::redhat7::gnome::rhel_07_010030 
  include stigs::redhat7::gnome::rhel_07_010040
  include stigs::redhat7::warning_banner::rhel_07_010050
  include stigs::redhat7::gnome::rhel_07_010060
  include stigs::redhat7::gnome::rhel_07_010070
  include stigs::redhat7::gnome::rhel_07_010080
  include stigs::redhat7::software::rhel_07_010090
  include stigs::redhat7::gnome::rhel_07_010100
  include stigs::redhat7::gnome::rhel_07_010110

  include stigs::redhat7::authentication::pwquality::rhel_07_010120
  include stigs::redhat7::authentication::pwquality::rhel_07_010130
  include stigs::redhat7::authentication::pwquality::rhel_07_010140
  include stigs::redhat7::authentication::pwquality::rhel_07_010150
  include stigs::redhat7::authentication::pwquality::rhel_07_010160
  include stigs::redhat7::authentication::pwquality::rhel_07_010170
  include stigs::redhat7::authentication::pwquality::rhel_07_010180
  include stigs::redhat7::authentication::pwquality::rhel_07_010190

  include stigs::redhat7::authentication::pam::rhel_07_010200
  include stigs::redhat7::authentication::login_defs::rhel_07_010210
  include stigs::redhat7::authentication::libuser::rhel_07_010220
  include stigs::redhat7::authentication::login_defs::rhel_07_010230
  include stigs::redhat7::authentication::rhel_07_010240
  include stigs::redhat7::authentication::login_defs::rhel_07_010250
  include stigs::redhat7::authentication::rhel_07_010260
  include stigs::redhat7::authentication::pam::rhel_07_010270
  include stigs::redhat7::authentication::pwquality::rhel_07_010280
  include stigs::redhat7::authentication::pam::rhel_07_010290
  include stigs::redhat7::authentication::ssh::rhel_07_010300
  include stigs::redhat7::authentication::useradd::rhel_07_010310
  include stigs::redhat7::authentication::pam::pam_faillock
  include stigs::redhat7::authentication::pam::rhel_07_010320
  include stigs::redhat7::authentication::pam::rhel_07_010330
  include stigs::redhat7::authentication::sudo::rhel_07_010340
  include stigs::redhat7::authentication::sudo::rhel_07_010350
  include stigs::redhat7::authentication::login_defs::rhel_07_010430
  include stigs::redhat7::gnome::rhel_07_010440
  include stigs::redhat7::gnome::rhel_07_010450
  include stigs::redhat7::authentication::ssh::rhel_07_010460
  include stigs::redhat7::authentication::ssh::rhel_07_010470
  include stigs::redhat7::software::rhel_07_020000
  include stigs::redhat7::software::rhel_07_020010
  include stigs::redhat7::system_integrity::rhel_07_020050
  include stigs::redhat7::system_integrity::rhel_07_020060
  include stigs::redhat7::system_integrity::rhel_07_020070
  include stigs::redhat7::kernel_module::rhel_07_020100
  include stigs::redhat7::services::rhel_07_020110
  include stigs::redhat7::system_integrity::rhel_07_020200
  include stigs::redhat7::system_integrity::rhel_07_020210
  include stigs::redhat7::system_integrity::rhel_07_020220
  include stigs::redhat7::gnome::rhel_07_020230
  include stigs::redhat7::authentication::login_defs::rhel_07_020240
  include stigs::redhat7::system_integrity::rhel_07_020320
  include stigs::redhat7::system_integrity::rhel_07_020330


  include stigs::redhat7::audit::rhel_07_030370
  include stigs::redhat7::audit::rhel_07_030380
  include stigs::redhat7::audit::rhel_07_030390
  include stigs::redhat7::audit::rhel_07_030400
  include stigs::redhat7::audit::rhel_07_030410
  include stigs::redhat7::audit::rhel_07_030420
  include stigs::redhat7::audit::rhel_07_030430
  include stigs::redhat7::audit::rhel_07_030440
  include stigs::redhat7::audit::rhel_07_030450
  include stigs::redhat7::audit::rhel_07_030460
  include stigs::redhat7::audit::rhel_07_030470
  include stigs::redhat7::audit::rhel_07_030480
  include stigs::redhat7::audit::rhel_07_030490
  include stigs::redhat7::audit::rhel_07_030500
  include stigs::redhat7::audit::rhel_07_030510

  include stigs::redhat7::authentication::ssh::rhel_07_040170


  include stigs::redhat7::software::rhel_07_040300
  include stigs::redhat7::services::rhel_07_040310
  include stigs::redhat7::authentication::ssh::rhel_07_040320
  include stigs::redhat7::authentication::ssh::rhel_07_040330
  include stigs::redhat7::authentication::ssh::rhel_07_040340
  include stigs::redhat7::authentication::ssh::rhel_07_040350
  include stigs::redhat7::authentication::ssh::rhel_07_040360
  include stigs::redhat7::authentication::ssh::rhel_07_040370
  include stigs::redhat7::authentication::ssh::rhel_07_040380
  include stigs::redhat7::authentication::ssh::rhel_07_040390
  include stigs::redhat7::authentication::ssh::rhel_07_040430
  include stigs::redhat7::authentication::ssh::rhel_07_040440
  include stigs::redhat7::authentication::ssh::rhel_07_040450
  include stigs::redhat7::authentication::ssh::rhel_07_040460
  include stigs::redhat7::authentication::ssh::rhel_07_040470
}

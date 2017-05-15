# DO NOT MODIFY THIS FILE
# To turn off a STIG, modify the params.pp file
class stigs::redhat7::redhat7 inherits stigs::redhat7::params {

  include stigs::redhat7::prerequisites::authentication::login_defs
  include stigs::redhat7::prerequisites::authentication::pam
  include stigs::redhat7::prerequisites::authentication::libuser
  include stigs::redhat7::prerequisites::authentication::ssh
  include stigs::redhat7::prerequisites::authentication::pwquality
  include stigs::redhat7::prerequisites::gnome

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
  include stigs::redhat7::authentication::pam::rhel_07_010320

}

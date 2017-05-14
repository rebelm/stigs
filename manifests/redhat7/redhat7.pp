# DO NOT MODIFY THIS FILE
# To turn off a STIG, modify the params.pp file
# classes that require other classes will be deinfed in each manifest
class stigs::redhat7::redhat7 inherits stigs::redhat7::params {

  include stigs::redhat7::software_integrity::rhel_07_010010
  include stigs::redhat7::software_integrity::rhel_07_010020
  
  include stigs::redhat7::prerequisites::gnome
  include stigs::redhat7::warning_banner::rhel_07_010030 
  include stigs::redhat7::warning_banner::rhel_07_010040
  include stigs::redhat7::desktop::rhel_07_010060
  include stigs::redhat7::desktop::rhel_07_010070
  include stigs::redhat7::desktop::rhel_07_010080

  include stigs::redhat7::software::rhel_07_010090
  include stigs::redhat7::desktop::rhel_07_010100
  include stigs::redhat7::desktop::rhel_07_010110

  include stigs::redhat7::prerequisites::password_complexity
  include stigs::redhat7::password_complexity::rhel_07_010120
  include stigs::redhat7::password_complexity::rhel_07_010130
  include stigs::redhat7::password_complexity::rhel_07_010140
  include stigs::redhat7::password_complexity::rhel_07_010150
  include stigs::redhat7::password_complexity::rhel_07_010160
  include stigs::redhat7::password_complexity::rhel_07_010170
  include stigs::redhat7::password_complexity::rhel_07_010180
  include stigs::redhat7::password_complexity::rhel_07_010190

  include stigs::redhat7::prerequisites::authentication
  include stigs::redhat7::authentication::rhel_07_010200
  include stigs::redhat7::authentication::rhel_07_010210
  include stigs::redhat7::authentication::rhel_07_010220
  include stigs::redhat7::authentication::rhel_07_010230
  include stigs::redhat7::authentication::rhel_07_010240
  include stigs::redhat7::authentication::rhel_07_010250
  include stigs::redhat7::authentication::rhel_07_010260
  include stigs::redhat7::authentication::rhel_07_010270
  include stigs::redhat7::password_complexity::rhel_07_010280
  include stigs::redhat7::authentication::rhel_07_010290
  include stigs::redhat7::authentication::rhel_07_010300

}

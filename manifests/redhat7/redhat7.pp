# DO NOT MODIFY THIS FILE
# To turn off a STIG, modify the params.pp file
# classes that require other classes will be deinfed in each manifest
class stigs::redhat7::redhat7 inherits stigs::redhat7::params {

  include stigs::redhat7::software_integrity::rhel_07_010010
  include stigs::redhat7::software_integrity::rhel_07_010020
  include stigs::redhat7::prerequisites::gnome
  include stigs::redhat7::warning_banner::rhel_07_010030 
  include stigs::redhat7::warning_banner::rhel_07_010031 
  include stigs::redhat7::warning_banner::rhel_07_010040
  include stigs::redhat7::desktop::rhel_07_010060
  include stigs::redhat7::desktop::rhel_07_010070
  include stigs::redhat7::desktop::rhel_07_010071
  include stigs::redhat7::software::rhel_07_010072
  include stigs::redhat7::desktop::rhel_07_010073
  include stigs::redhat7::desktop::rhel_07_010074
  include stigs::redhat7::password_complexity::rhel_07_010090
  include stigs::redhat7::password_complexity::rhel_07_010100
  include stigs::redhat7::password_complexity::rhel_07_010110
  include stigs::redhat7::password_complexity::rhel_07_010120
  include stigs::redhat7::password_complexity::rhel_07_010130
  include stigs::redhat7::password_complexity::rhel_07_010140
  include stigs::redhat7::password_complexity::rhel_07_010150
  include stigs::redhat7::password_complexity::rhel_07_010160

}

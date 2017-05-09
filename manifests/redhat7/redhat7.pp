# DO NOT MODIFY THIS FILE
# To turn off a STIG, modify the params.pp file
# classes that require other classes will be deinfed in each manifest
class stigs::redhat7::redhat7 inherits stigs::redhat7::params {

  include stigs::redhat7::software_integrity::rhel_07_010010
  include stigs::redhat7::software_integrity::rhel_07_010020
  include stigs::redhat7::warning_banner::prerequisites
  include stigs::redhat7::warning_banner::rhel_07_010030 
  include stigs::redhat7::warning_banner::rhel_07_010031 
  include stigs::redhat7::warning_banner::rhel_07_010040

}

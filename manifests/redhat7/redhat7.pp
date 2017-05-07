class stigs::redhat7::redhat7 inherits stigs::redhat7::params {

  include stigs::redhat7::software_integrity::rhel_07_010010
  include stigs::redhat7::software_integrity::rhel_07_010020
  include stigs::redhat7::warning_banner::rhel_07_010030

}

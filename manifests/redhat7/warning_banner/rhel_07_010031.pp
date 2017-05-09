# STIG-ID: RHEL-07-010031
# Rule-ID: RHEL-07-010031_rule
# Vuln-ID: RHEL-07-010031
# Severity: CAT II
# Class: Unclass
class stigs::redhat7::warning_banner::rhel_07_010031 inherits stigs::redhat7::redhat7 {

  if $rhel_07_010031 == 'present' {
    $ensure = 'present'
  }
  else {
    $ensure = 'absent'
  }

  # The Gnome configuration file doesn't allow you to spread a value out over several lines, so
  # the only way to implement this properly was with this ugly one lined string.
  $banner='You are accessing a U.S. Government (USG) Information System (IS) that is\nprovided for USG-authorized use only. By using this IS (which includes any\ndevice attached to this IS), you consent to the following conditions:\n \n-The USG routinely intercepts and monitors communications on this IS for\npurposes including, but not limited to, penetration testing, COMSEC monitoring,\nnetwork operations and defense, personnel misconduct (PM), law enforcement\n(LE), and counterintelligence (CI) investigations.\n \n-At any time, the USG may inspect and seize data stored on this IS.\n  \n-Communications using, or data stored on, this IS are not private, are subject\nto routine monitoring, interception, and search, and may be disclosed or used\nfor any USG-authorized purpose.\n \n-This IS includes security measures (e.g., authentication and access controls)\nto protect USG interests -- not for your personal benefit or privacy.\n  \n-Notwithstanding the above, using this IS does not constitute consent to PM, LE\nor CI investigative searching or monitoring of the content of privileged\ncommunications, or work product, related to personal representation or services\nby attorneys, psychotherapists, or clergy, and their assistants. Such\ncommunications and work product are private and confidential. See User\nAgreement for details.'

  $banner_message = "[org/gnome/login-screen]\nbanner-message-text='$banner'"

  file_line { 'Gnome-Banner_Message':
    ensure => $ensure,
    line   => "banner-message-text='$banner'",
    path   =>  '/etc/dconf/db/local.d/01-banner',
  }

}

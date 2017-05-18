class stigs {

  case $facts['os']['name'] {
    'CentOS', 'RedHat': {
       if $facts['os']['release']['major'] == '7' {
         include stigs::redhat7::redhat7
       }
    }
    default: {
      warning('This stigs module is not supported on this OS')
    }

  }

}

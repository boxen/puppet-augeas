# Public: Install augeas via homebrew.
#
# Examples
#
#   include augeas
class augeas {
  case $::operatingsystem {
    'Darwin': {
      include homebrew
      require pkgconfig

      case $::macosx_productversion_major {
        '10.8': {
          homebrew::formula { 'augeas': }

          package { 'boxen/brews/augeas':
            ensure => '0.8.1-boxen2'
          }
        }

        '10.9': {
          package { 'augeas': }

          homebrew::formula { 'augeas':
            ensure => absent
          }
        }

        default: {
          package { 'augeas': }
        }
      }
    }

    default: {
      package { 'augeas': }
    }
  }
}

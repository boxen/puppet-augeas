# Public: Install augeas via homebrew.
#
# Examples
#
#   include augeas
class augeas {
  case $::operatingsystem {
    'Darwin': {
      include homebrew
      include pkgconfig

      case $::macosx_productversion_major {
        '10.8': {
          homebrew::formula { 'augeas': }

          package { 'augeas':
            name   => 'boxen/brews/augeas',
            ensure => '0.8.1-boxen2'
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

  Package <| title == 'augeas' |> {
    require +> Class['pkgconfig']
  }
}

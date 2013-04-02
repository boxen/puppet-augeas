# Public: Install augeas via homebrew.
#
# Examples
#
#   include augeas
class augeas {
  require homebrew

  # required to build ruby-augeas
  homebrew::formula { 'pkg-config': }
  homebrew::formula { 'augeas': }

  package { 'boxen/brews/pkg-config':
    ensure => '0.28-boxen1'
  }

  package { 'boxen/brews/augeas':
    ensure => '0.8.1-boxen2'
  }
}

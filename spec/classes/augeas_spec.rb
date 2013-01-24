require 'spec_helper'

describe 'augeas' do
  let(:facts) do
    {
      :boxen_home => '/opt/boxen',
      :boxen_user => 'wfarr',
    }
  end

  it do
    should include_class('homebrew')

    should contain_homebrew__formula('augeas')

    should contain_package('boxen/brews/augeas').with({
      :ensure => '0.8.1-boxen2'
    })
  end
end

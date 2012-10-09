require 'spec_helper'

describe 'augeas' do
  it do
    should contain_package('boxen/brews/augeas').with({
      :ensure => '0.8.1-boxen2'
    })
  end
end

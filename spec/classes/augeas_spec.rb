require 'spec_helper'

describe 'augeas' do
  it { should contain_package('augeas') }
end

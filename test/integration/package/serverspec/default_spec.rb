require_relative 'spec_helper'

describe 'standard elasticsearch2 install and configure' do
  it_behaves_like 'elasticsearch2 user'
  it_behaves_like 'elasticsearch2 install'
  it_behaves_like 'elasticsearch2 configure'
  it_behaves_like 'elasticsearch2 plugin', 'head'
  it_behaves_like 'elasticsearch2 service'
end

describe package('elasticsearch') do
  it { should be_installed }
end

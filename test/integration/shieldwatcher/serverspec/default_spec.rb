require_relative 'spec_helper'

describe 'standard elasticsearch2 install and configure' do
  it_behaves_like 'elasticsearch2 user'
  it_behaves_like 'elasticsearch2 install'
  it_behaves_like 'elasticsearch2 configure'

  # because shield, these now should return failures
  it_behaves_like 'elasticsearch2 plugin', 'head', response_code: 401
  it_behaves_like 'elasticsearch2 service', 'elasticsearch', content: 'missing authentication'
end

describe package('elasticsearch') do
  it { should be_installed }
end

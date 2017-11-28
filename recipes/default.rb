# Encoding: utf-8
#
# Cookbook Name:: elasticsearch2
# Recipe:: default
#

include_recipe 'chef-sugar'

# see README.md and test/fixtures/cookbooks for more examples!
elasticsearch2_user 'elasticsearch'
elasticsearch2_install 'elasticsearch' do
  type node['elasticsearch2']['install_type'].to_sym # since TK can't symbol.
end
elasticsearch2_configure 'elasticsearch'
elasticsearch2_service 'elasticsearch'

# by default, no plugins

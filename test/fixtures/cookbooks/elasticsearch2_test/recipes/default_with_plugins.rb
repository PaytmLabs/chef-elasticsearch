# Encoding: utf-8
#
# Cookbook Name:: elasticsearch2_test
# Recipe:: default_with_plugins
#
# This cookbook is designed to be just elasticsearch::default plus installing
# some plugins. We want to test the default plugin resource without any
# interesting overrides, but don't want to ship that as a recipe in the main
# cookbook (unlike install, configure, and service, which we do ship in the
# default cookbook).

# see README.md and test/fixtures/cookbooks for more examples!
include_recipe 'chef-sugar'

# see README.md and test/fixtures/cookbooks for more examples!
elasticsearch2_user 'elasticsearch'
elasticsearch2_install 'elasticsearch' do
  type node['elasticsearch2']['install_type'].to_sym # since TK can't symbol.
end
elasticsearch2_configure 'elasticsearch'
elasticsearch2_service 'elasticsearch' do
  service_actions [:enable, :start]
end

# by default, no plugins, but we do one here.
elasticsearch2_plugin 'head' do
  url 'mobz/elasticsearch-head'
  notifies :restart, 'elasticsearch2_service[elasticsearch]', :delayed
end

# remove an installed plugin
elasticsearch2_plugin 'kopf' do
  url 'lmenezes/elasticsearch-kopf'
  action [:install, :remove]
  notifies :restart, 'elasticsearch2_service[elasticsearch]', :delayed
end

# remove a non-existent plugin
elasticsearch2_plugin 'pleasedontexist' do
  action :remove
  notifies :restart, 'elasticsearch2_service[elasticsearch]', :delayed
end

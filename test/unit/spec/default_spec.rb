# Encoding: utf-8

require_relative 'spec_helper'

describe 'elasticsearch2::default' do
  before { stub_resources }
  supported_platforms.each do |platform, versions|
    versions.each do |version|
      context "on #{platform.capitalize} #{version}" do
        let(:chef_run) do
          ChefSpec::ServerRunner.new(platform: platform, version: version) do |node, server|
            node_resources(node) # data for this node
            stub_chef_zero(platform, version, server) # stub other nodes in chef-zero
          end.converge(described_recipe)
        end

        # any platform specific data you want available to your test can be loaded here
        _property = load_platform_properties(platform: platform, platform_version: version)

        it 'creates elasticsearch2_user' do
          expect(chef_run).to create_elasticsearch2_user('elasticsearch')
        end

        it 'installs elasticsearch2' do
          expect(chef_run).to install_elasticsearch2('elasticsearch')
        end
      end
    end
  end
end

# Encoding: utf-8

require_relative 'spec_helper'

describe 'elasticsearch2_test::tarball' do
  before { stub_resources }
  supported_platforms.each do |platform, versions|
    versions.each do |version|
      context "on #{platform.capitalize} #{version}" do
        let(:chef_run) do
          ChefSpec::ServerRunner.new(platform: platform, version: version, step_into: ['elasticsearch2_install']) do |node, server|
            node_resources(node) # data for this node
            stub_chef_zero(platform, version, server) # stub other nodes in chef-zero
          end.converge(described_recipe)
        end

        # any platform specific data you want available to your test can be loaded here
        _property = load_platform_properties(platform: platform, platform_version: version)

        it 'installs elasticsearch2' do
          expect(chef_run).to install_elasticsearch2('elasticsearch_s')
        end
      end
    end
  end
end

describe 'elasticsearch2_test::package' do
  before { stub_resources }
  supported_platforms.each do |platform, versions|
    versions.each do |version|
      context "on #{platform.capitalize} #{version}" do
        let(:chef_run) do
          ChefSpec::ServerRunner.new(platform: platform, version: version, step_into: ['elasticsearch2_install']) do |node, server|
            node_resources(node) # data for this node
            stub_chef_zero(platform, version, server) # stub other nodes in chef-zero
          end.converge(described_recipe)
        end

        # any platform specific data you want available to your test can be loaded here
        _property = load_platform_properties(platform: platform, platform_version: version)

        it 'installs elasticsearch2' do
          expect(chef_run).to install_elasticsearch2('elasticsearch_p')
        end
      end
    end
  end
end

describe 'elasticsearch2_test::tarball with bad version' do
  before { stub_resources }
  supported_platforms.each do |platform, versions|
    versions.each do |version|
      context "on #{platform.capitalize} #{version}" do
        let(:chef_run) do
          ChefSpec::ServerRunner.new(platform: platform, version: version, step_into: ['elasticsearch2_install']) do |node, server|
            node_resources(node) # data for this node
            stub_chef_zero(platform, version, server) # stub other nodes in chef-zero
            node.override['elasticsearch2']['version'] = '99.99.99'
          end.converge('elasticsearch2_test::tarball')
        end

        # any platform specific data you want available to your test can be loaded here
        _property = load_platform_properties(platform: platform, platform_version: version)

        it 'installs elasticsearch2' do
          expect(chef_run).to install_elasticsearch2('elasticsearch_s')
        end
      end
    end
  end
end

describe 'elasticsearch2_test::tarball with bad low version' do
  before { stub_resources }
  supported_platforms.each do |platform, versions|
    versions.each do |version|
      context "on #{platform.capitalize} #{version}" do
        let(:chef_run) do
          ChefSpec::ServerRunner.new(platform: platform, version: version, step_into: ['elasticsearch2_install']) do |node, server|
            node_resources(node) # data for this node
            stub_chef_zero(platform, version, server) # stub other nodes in chef-zero
            node.override['elasticsearch2']['version'] = '0.0.1'
          end.converge('elasticsearch2_test::tarball')
        end

        # any platform specific data you want available to your test can be loaded here
        _property = load_platform_properties(platform: platform, platform_version: version)

        it 'installs elasticsearch2' do
          expect(chef_run).to install_elasticsearch2('elasticsearch_s')
        end
      end
    end
  end
end

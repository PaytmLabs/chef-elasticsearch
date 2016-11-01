#
# Cookbook Name:: elasticsearch_test
# Recipe:: doubleinstances
#
# Example of creating two ES instances on a single server

elasticsearch_user 'elasticsearch'

# for package install, share the various paths across instances
elasticsearch_install 'elasticsearch' do
  type 'package'
end

elasticsearch_plugin 'elasticsearch_xpack' do
  instance_name 'x-pack'
  # notifies :restart, "elasticsearch_service[elasticsearch]", :delayed
  not_if { ::File.exist?('/usr/share/elasticsearch/plugins/x-pack') }
end

settings = {
  alpha: {
    http_port: 9201,
    transport_port: 9301,
    discovery_hosts: '127.0.0.1:9302'
  },
  beta: {
    http_port: 9202,
    transport_port: 9302,
    discovery_hosts: '127.0.0.1:9301'
  }
}

%w(alpha beta).each do |instance_name|
  elasticsearch_configure "elasticsearch_#{instance_name}" do
    instance_name instance_name
    path_home    '/usr/share/elasticsearch'
    path_conf    "/etc/elasticsearch-#{instance_name}"
    path_data    "/var/lib/elasticsearch/#{instance_name}"
    path_logs    "/var/log/elasticsearch-#{instance_name}"
    path_pid     "/var/run/elasticsearch-#{instance_name}"
    path_plugins '/usr/share/elasticsearch/bin/plugin'
    path_bin     '/usr/share/elasticsearch/bin'
    allocated_memory '256m'
    configuration(
      'cluster.name' => 'mycluster',
      'node.name' => "node_#{instance_name}",
      'network.host' => '127.0.0.1',
      'http.port' => settings[instance_name.to_sym][:http_port].to_s,
      'transport.tcp.port' => settings[instance_name.to_sym][:transport_port].to_s
    )
  end

  elasticsearch_service "elasticsearch_#{instance_name}" do
    instance_name instance_name
    service_actions [:enable, :start]
  end
end

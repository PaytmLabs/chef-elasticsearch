# this is a test fixture used to test that the elasticsearch2 cookbook's
# resources, providers, and recipes can be used correctly from a wrapper

# create user with all non-default overriden options
elasticsearch2_user 'foobar' do
  groupname 'bar'
  username 'foo'
  uid 1111
  gid 2222
  shell '/bin/sh'
  instance_name 'special_package_instance'
end

# we're going to test both types on a single system!
elasticsearch2_install 'elasticsearch_p' do
  type :package
  instance_name 'special_package_instance'
end

elasticsearch2_configure 'my_elasticsearch' do
  logging(action: 'INFO')

  allocated_memory '123m'
  thread_stack_size '512k'

  env_options '-DFOO=BAR'
  gc_settings <<-CONFIG
                -XX:+UseParNewGC
                -XX:+UseConcMarkSweepGC
                -XX:CMSInitiatingOccupancyFraction=75
                -XX:+UseCMSInitiatingOccupancyOnly
                -XX:+HeapDumpOnOutOfMemoryError
                -XX:+PrintGCDetails
              CONFIG

  configuration('node.name' => 'arbitrary_name')
  # plugin_dir '/usr/local/awesome/elasticsearch-1.7.3/plugins'
  action :manage
  instance_name 'special_package_instance'
end

elasticsearch2_plugin 'head' do
  instance_name 'special_package_instance'
  url 'mobz/elasticsearch-head'
end

elasticsearch2_service 'elasticsearch-crazy' do
  instance_name 'special_package_instance'
  service_actions [:enable, :start]
end

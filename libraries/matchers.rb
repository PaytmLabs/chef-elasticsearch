# ChefSpec is a tool to unit test cookbooks in conjunction with rspec
# Learn more on the README or at https://github.com/sethvargo/chefspec.
if defined?(ChefSpec)
  ChefSpec.define_matcher(:elasticsearch2_configure)
  ChefSpec.define_matcher(:elasticsearch2_install)
  ChefSpec.define_matcher(:elasticsearch2_plugin)
  ChefSpec.define_matcher(:elasticsearch2_service)
  ChefSpec.define_matcher(:elasticsearch2_user)

  def create_elasticsearch2_user(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:elasticsearch2_user, :create, resource_name)
  end

  def remove_elasticsearch2_user(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:elasticsearch2_user, :remove, resource_name)
  end

  def install_elasticsearch2(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:elasticsearch2_install, :install, resource_name)
  end

  def remove_elasticsearch2(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:elasticsearch2_install, :remove, resource_name)
  end

  def manage_elasticsearch2_configure(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:elasticsearch2_configure, :manage, resource_name)
  end

  def remove_elasticsearch2_configure(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:elasticsearch2_configure, :remove, resource_name)
  end

  def configure_elasticsearch2_service(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:elasticsearch2_service, :configure, resource_name)
  end

  def remove_elasticsearch2_service(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:elasticsearch2_service, :remove, resource_name)
  end

  def enable_elasticsearch2_service(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:elasticsearch2_service, :enable, resource_name)
  end

  def disable_elasticsearch2_service(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:elasticsearch2_service, :disable, resource_name)
  end

  def start_elasticsearch2_service(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:elasticsearch2_service, :start, resource_name)
  end

  def stop_elasticsearch2_service(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:elasticsearch2_service, :stop, resource_name)
  end

  def restart_elasticsearch2_service(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:elasticsearch2_service, :restart, resource_name)
  end

  def status_elasticsearch2_service(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:elasticsearch2_service, :status, resource_name)
  end

  def install_elasticsearch2_plugin(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:elasticsearch2_plugin, :install, resource_name)
  end

  def remove_elasticsearch2_plugin(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:elasticsearch2_plugin, :remove, resource_name)
  end
end

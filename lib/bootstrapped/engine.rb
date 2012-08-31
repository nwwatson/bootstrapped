require 'rails'

module Bootstrapped
  class Engine < ::Rails::Engine
    # If using JRUBY, don't load less configuration
    unless RUBY_PLATFORM.eql?('java')    
      initializer 'twitter-bootstrap-rails.setup', 
        :after => 'less-rails.after.load_config_initializers', 
        :group => :all do |app|
          app.config.less.paths << File.join(config.root, 'vendor', 'less')
          app.config.less.paths << File.join(config.root, 'vendor', 'externals','Font-Awesome','less')
      end
    end
  end
end
require 'rails'

module Bootstrapped
  class Engine < ::Rails::Engine
    initializer 'bootstrapped.setup', 
      :after => 'less-rails.after.load_config_initializers', 
      :group => :all do |app|
        app.config.less.paths << File.join(config.root, 'vendor', 'less')
    end
  end
end
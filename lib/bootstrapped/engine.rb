module Bootstrapped
  class Engine < ::Rails::Engine
    initializer 'bootstrapped-less.setup', :after => 'less-rails.after.load_config_initializers', :group => :all do |app|
      app.config.less.paths << File.join(app.root, 'app', 'assets', 'stylesheets','bootstrap','less')
    end
    
    #application.config.assets.paths << Rails.root.join("vendor", "bootstrap", "js")

    
  end
end
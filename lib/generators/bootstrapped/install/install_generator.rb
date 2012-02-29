require 'rails/generators/base'
require 'generators/bootstrapped'

module Bootstrapped
  module Generators
    class InstallGenerator < ::Bootstrapped::Generators::Base
      desc "This generator installs Twitter Bootstrap to Asset Pipeline"
      argument :css_engine, :type => :string, :default => 'less'
      
      def add_assets
        
        if File.exist?('app/assets/javascripts/application.js')
          insert_into_file "app/assets/javascripts/application.js", "//= require bootstrap\n", :after => "jquery_ujs\n"
        else
          copy_file "application.js", "app/assets/javascripts/application.js"
        end

        unless css_engine.eql?('static')        
          if File.exist?('app/assets/stylesheets/application.css')
            # Add our own require:
            content = File.read("app/assets/stylesheets/application.css")
            if content.match(/require_tree\s+\./)
              # Good enough - that'll include our bootstrap_and_overrides.css.less
            else
              style_require_block = " *= require bootstrap_and_overrides\n"
              insert_into_file "app/assets/stylesheets/application.css", style_require_block, :after => "require_self\n"
            end
          else
            copy_file "application.css", "app/assets/stylesheets/application.css"
          end
        else
          style_require_block = " *= require twitter/bootstrap/static/bootstrap\n"
          insert_into_file "app/assets/stylesheets/application.css", style_require_block, :after => "require_self\n"
        end

      end
      
      def add_gems
        unless css_engine.eql?('static')
          add_gem 'less'
          add_gem 'less-rails'
        end
      end

      def add_bootstrap
        copy_file "bootstrap.coffee", "app/assets/javascripts/bootstrap.js.coffee"
        unless css_engine.eql?('static')
          copy_file "bootstrap_and_overrides.less", "app/assets/stylesheets/bootstrap_and_overrides.css.less"
        end
      end
      
    end
  end
end

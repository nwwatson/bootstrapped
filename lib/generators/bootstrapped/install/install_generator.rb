require 'rails/generators/base'
require 'generators/bootstrapped'

module Bootstrapped
  module Generators
    class InstallGenerator < ::Bootstrapped::Generators::Base
      desc "This generator installs Twitter Bootstrap to Asset Pipeline"
      argument :css_engine, :type => :string, :default => 'less'
      class_option :javascripts, :type => :boolean, :default => true, :description => "Include Twitter Bootstrap javascript files"
      
      def add_assets

        unless css_engine.eql?('static')        
          if File.exist?('app/assets/stylesheets/application.css')
            style_require_block = " *= require bootstrap_and_overrides\n"
            insert_into_file "app/assets/stylesheets/application.css", style_require_block, :after => "require_self\n"
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
      
      def add_javascript
        if options.javascripts?
          insert_into_file "app/assets/javascripts/application.js","//= require bootstrap-transition.js\n", :before => "//= require_tree ."
          insert_into_file "app/assets/javascripts/application.js","//= require bootstrap-alert.js\n", :before => "//= require_tree ."
          insert_into_file "app/assets/javascripts/application.js","//= require bootstrap-modal.js\n", :before => "//= require_tree ."
          insert_into_file "app/assets/javascripts/application.js","//= require bootstrap-dropdown.js\n", :before => "//= require_tree ."
          insert_into_file "app/assets/javascripts/application.js","//= require bootstrap-scrollspy.js\n", :before => "//= require_tree ."
          insert_into_file "app/assets/javascripts/application.js","//= require bootstrap-tab.js\n", :before => "//= require_tree ."
          insert_into_file "app/assets/javascripts/application.js","//= require bootstrap-tooltip.js\n", :before => "//= require_tree ."
          insert_into_file "app/assets/javascripts/application.js","//= require bootstrap-popover.js\n", :before => "//= require_tree ."
          insert_into_file "app/assets/javascripts/application.js","//= require bootstrap-button.js\n", :before => "//= require_tree ."
          insert_into_file "app/assets/javascripts/application.js","//= require bootstrap-collapse.js\n", :before => "//= require_tree ."
          insert_into_file "app/assets/javascripts/application.js","//= require bootstrap-carousel.js\n", :before => "//= require_tree ."
          insert_into_file "app/assets/javascripts/application.js","//= require bootstrap-typeahead.js\n", :before => "//= require_tree ."
          insert_into_file "app/assets/javascripts/application.js", "//= require bootstrap\n", :before => "//= require_tree ."
        end
      end
      
    end
  end
end

require 'generators/bootstrapped'

module Bootstrapped
  module Generators
    class InstallGenerator < Base
      argument :less, :type => :string, :default => true, :banner => 'less'

      def add_less_rails_gem
        gem 'less-rails', :group => :assets
      end
      
      def copy_less_files
        copy_file 'bootstrap.less', "app/assets/stylesheets/bootstrap/less/bootstrap.less"
        copy_file 'forms.less', "app/assets/stylesheets/bootstrap/less/forms.less"
        copy_file 'mixins.less', "app/assets/stylesheets/bootstrap/less/mixins.less"
        copy_file 'patterns.less', "app/assets/stylesheets/bootstrap/less/patterns.less"
        copy_file 'reset.less', "app/assets/stylesheets/bootstrap/less/reset.less"
        copy_file 'scaffolding.less', "app/assets/stylesheets/bootstrap/less/scaffolding.less"
        copy_file 'tables.less', "app/assets/stylesheets/bootstrap/less/tables.less"
        copy_file 'type.less', "app/assets/stylesheets/bootstrap/less/type.less"
        copy_file 'variables.less', "app/assets/stylesheets/bootstrap/less/variables.less"
      end

    end
  end
end

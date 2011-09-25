require 'generators/bootstrapped'

module Bootstrapped
  module Generators
    class LayoutGenerator < Base
      argument :layout_name, :type => :string, :default => 'application', :banner => 'layout_name'

      def create_layout
        template 'layout.html.erb', "app/views/layouts/#{file_name}.html.erb"
        copy_file 'layout_helper.rb', 'app/helpers/layout_helper.rb'
        copy_file 'error_messages_helper.rb', 'app/helpers/error_messages_helper.rb'
        copy_file '_flash.html.erb', 'app/views/share/_flash.html.erb'
      end

      private

      def file_name
        layout_name.underscore
      end
    end
  end
end

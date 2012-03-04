require 'generators/bootstrapped'

module Bootstrapped
  module Generators
    class LayoutGenerator < Base
      desc "This generator generates layout file with navigation."
      argument :layout_name, :type => :string, :default => "application"
      argument :layout_type, :type => :string, :default => "fixed",
               :banner => "*fixed or fluid"
      class_option :haml, :desc => 'Generate HAML for view, and SASS for stylesheet.', :type => :boolean

      attr_reader :app_name, :container_class

      def generate_layout
        app = ::Rails.application
        @app_name = app.class.to_s.split("::").first
        @container_class = layout_type == "fluid" ? "container-fluid" : "container"
        if options.haml?
          template "layout.html.haml", "app/views/layouts/#{layout_name}.html.haml"
        else
          template "layout.html.erb", "app/views/layouts/#{layout_name}.html.erb"
        end
      end

      def copy_additional_files
        copy_file 'layout_helper.rb', 'app/helpers/layout_helper.rb'
        copy_file 'error_messages_helper.rb', 'app/helpers/error_messages_helper.rb'
        copy_file '_flash.html.erb', 'app/views/share/_flash.html.erb'
      end

    end
  end
end

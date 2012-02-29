require 'generators/bootstrapped'

module Bootstrapped
  module Generators
    class LayoutGenerator < Base
      source_root File.expand_path("../templates", __FILE__)
      desc "This generator generates layout file with navigation."
      argument :layout_name, :type => :string, :default => "application"
      argument :layout_type, :type => :string, :default => "fixed",
               :banner => "*fixed or fluid"

      attr_reader :app_name, :container_class

      def generate_layout
        app = ::Rails.application
        @app_name = app.class.to_s.split("::").first
        @container_class = layout_type == "fluid" ? "container-fluid" : "container"
        template "layout.html.erb", "app/views/layouts/#{layout_name}.html.erbs"
      end

      def copy_additional_files
        copy_file 'layout_helper.rb', 'app/helpers/layout_helper.rb'
        copy_file 'error_messages_helper.rb', 'app/helpers/error_messages_helper.rb'
        copy_file '_flash.html.erb', 'app/views/share/_flash.html.erb'
      end

    end
  end
end

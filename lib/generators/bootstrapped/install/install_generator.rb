require 'rails/generators/base'
require 'generators/bootstrapped'

module Bootstrapped
  module Generators
    class InstallGenerator < ::Bootstrapped::Generators::Base
      argument :less, :type => :string, :default => true, :banner => 'less'
      
      
      #@source_root File.expand_path("", __FILE__)
      def self.source_root
        File.expand_path("../../../../../vendor/assets/bootstrap/", __FILE__)
      end
      
      def copy_less_files
        directory 'less', 'app/assets/stylesheets/bootstrap/less'
      end

    end
  end
end

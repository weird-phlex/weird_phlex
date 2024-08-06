# frozen_string_literal: true

module WeirdPhlex
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)

      def create_initializer
        template 'weird_phlex.rb', 'config/initializers/weird_phlex.rb'
      end

      def create_component_directory
        empty_directory WeirdPhlex.configuration.component_path
      end

      def copy_components
        directory "components", WeirdPhlex.configuration.component_path
      end
    end
  end
end
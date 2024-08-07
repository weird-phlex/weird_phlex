# frozen_string_literal: true

require "rails/generators/base"

module WeirdPhlex
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("./", __dir__)

      def create_initializer
        template "templates/weird_phlex.rb", "config/initializers/weird_phlex.rb"
      end

      def create_component_directory
        empty_directory WeirdPhlex.configuration.component_path
      end

      def copy_components
        directory "../../components", WeirdPhlex.configuration.component_path
      end
    end
  end
end

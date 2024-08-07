# frozen_string_literal: true

require "weird_phlex/version"
require "weird_phlex/engine" if defined?(Rails::Engine)
require "weird_phlex/configurations"
require "weird_phlex/helper"
require "weird_phlex/generators/weird_phlex/install_generator"

module WeirdPhlex
  class << self
    attr_writer :configuration

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end
  end

  # requires each component
  # TODO: possibly export this logic to other file
  def self.load_components
    base_component = File.join(__dir__, "weird_phlex", "components", "base_component.rb")
    require base_component

    Dir[File.join(__dir__, "weird_phlex", "components", "**", "*.rb")].each { |file| require file }
  end

  load_components
end

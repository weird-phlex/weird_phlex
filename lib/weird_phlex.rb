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
end

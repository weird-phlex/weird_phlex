# frozen_string_literal: true

require "weird_phlex/version"
require "weird_phlex/engine" if defined?(Rails::Engine)
require "weird_phlex/configuration"
require "weird_phlex/helper"


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
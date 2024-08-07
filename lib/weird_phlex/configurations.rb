# frozen_string_literal: true

module WeirdPhlex
  class Configuration
    CONFIGURABLE_ATTRIBUTES = [:component_path]

    CONFIGURABLE_ATTRIBUTES.each do |attr|
      attr_accessor attr
    end

    def initialize
      @component_path = "app/views/components/weird_phlex"
    end
  end
end

# frozen_string_literal: true

module WeirdPhlex
  class AlertComponent < BaseComponent
    def initialize(name)
      @name = name
    end

    def template
      h1 { "👋 Hello #{@name}!" }
    end
  end
end

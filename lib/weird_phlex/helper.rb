# frozen_string_literal: true

module WeirdPhlex
  module Helper
    def render_alert(name)
      WeirdPhlex::AlertComponent.new(name).call
    end
  end 
end
# frozen_string_literal: true

module WeirdPhlex # :nodoc:
  class Engine < ::Rails::Engine # :nodoc:
    isolate_namespace WeirdPhlex


    initializer "wierd_phlex.helpers" do
      ActiveSupport.on_load(:action_view) do
        include WeirdPhlex::Helper
      end
    end
  end
end

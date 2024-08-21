# frozen_string_literal: true

module WeirdPhlex
  module Core
    class Main
      class << self
        def generate(args)
          p "this method should be invoked from weird_phlex generate(g) executable"
          WeirdPhlex::Core::Planner.initial_full_installation_plan.perform!
        end

        def list
          p "this method should be invoked from weird_phlex list(l) executable"
        end

        def diff
          p "this method should be invoked from weird_phlex diff(d) executable"
        end

        def update(args)
          p "this method should be invoked from weird_phlex update(u) [ARGS] executable"
          p "args: #{args}"
        end
      end
    end
  end
end

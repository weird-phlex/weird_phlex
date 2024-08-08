module WeirdPhlex
  module Core
    module Node
      class Variant
        def initialize(name)
          @name = name
          @components = []
        end

        attr_reader :name, :components

        def add_component(name)
          component = Component.new(name)
          @components << component
          component
        end

        def component(name)
          components.find { _1.name == name } || add_component(name)
        end

        def format
          puts "    #{@name}"
          @components.each(&:format)
        end
      end
    end
  end
end

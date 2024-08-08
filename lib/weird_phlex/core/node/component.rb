module WeirdPhlex
  module Core
    module Node
      class Component
        def initialize(name)
          @name = name
          @parts = []
        end

        attr_reader :name, :parts

        def add_part(name)
          part = Part.new(name)
          @parts << part
          part
        end

        def part(name)
          parts.find { _1.name == name } || add_part(name)
        end

        def format
          puts "      #{@name}"
          @parts.each(&:format)
        end
      end
    end
  end
end

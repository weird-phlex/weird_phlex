module WeirdPhlex
  module Core
    module Node
      class Library
        def initialize(name)
          @name = name
          @variants = []
        end

        attr_reader :name, :variants

        def add_variant(name)
          variant = Variant.new(name)
          @variants << variant
          variant
        end

        def variant(name)
          variants.find { _1.name == name } || add_variant(name)
        end

        def format
          puts "  #{@name}"
          @variants.each(&:format)
        end
      end
    end
  end
end

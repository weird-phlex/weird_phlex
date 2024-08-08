module WeirdPhlex
  module Core
    module Node
      class Index
        def initialize
          @libraries = []
        end

        attr_reader :libraries

        def add_library(name)
          library = Library.new(name)
          @libraries << library
          library
        end

        def library(name)
          libraries.find { _1.name == name } || add_library(name)
        end

        def format
          puts "=== Index ==="
          @libraries.each(&:format)
          nil
        end
      end
    end
  end
end

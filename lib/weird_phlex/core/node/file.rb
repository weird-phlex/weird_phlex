module WeirdPhlex
  module Core
    module Node
      class File
        def initialize(name)
          @name = name
        end

        attr_reader :name

        def format
          puts "          #{@name}"
        end
      end
    end
  end
end

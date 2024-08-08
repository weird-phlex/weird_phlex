module WeirdPhlex
  module Core
    module Node
      class Part
        def initialize(name)
          @name = name
          @files = []
        end

        attr_reader :name, :files

        def add_file(name)
          file = File.new(name)
          @files << file
          file
        end

        def file(name)
          files.find { _1.name == name } || add_file(name)
        end

        def format
          puts "        #{@name}"
          @files.each(&:format)
        end
      end
    end
  end
end

module WeirdPhlex
  module Core
    class ComponentPack
      class Component
        def initialize(name, files: [])
          @name = name
          @file = files
        end

        def to_s
          "#{@name} - #{@file.count} file#{'s' if @file.count != 1}"
        end
      end
    end
  end
end

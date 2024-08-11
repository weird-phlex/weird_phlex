# frozen_string_literal: true

module WeirdPhlex
  module Core
    module ComponentPack
      class Component
        def initialize(name, files: [])
          @name = name
          @files = files
        end

        attr_reader :files

        def to_s
          "#{@name} - #{@files.count} file#{"s" if @files.count != 1}"
        end
      end
    end
  end
end

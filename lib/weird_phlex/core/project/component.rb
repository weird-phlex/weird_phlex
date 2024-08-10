require 'weird_phlex/core/project/file'

module WeirdPhlex
  module Core
    module Project
      class Component

        # Probably not correct. We might not want to group files from different libraries
        # and variants (inconsistent state) together.
        def self.all
          WeirdPhlex::Core::Project::File.all
            .select(&:component_file?)
            .group_by(&:component)
            .map { |component_name, files| new(component_name, files: files) }
        end

        def initialize(name, files: [])
          @name = name
          @files = files
        end

        attr_reader :files

        def to_s
          "#{@name} - #{@files.count} file#{'s' if @files.count != 1}"
        end
      end
    end
  end
end

module WeirdPhlex
  module Core
    module Project
      class TargetFile
        # This class represents a not yet existing file in the target project.
        # We use this as a placeholder for the planner.

        def self.from_component_pack_file(file)
          new(
            component: file.component,
            part: file.part,
            file: file.file
          )
        end

        # library:, variant:,
        def initialize(component:, part:, file:)
          # @library = library
          # @variant = variant
          @component = component
          @part = part
          @file = file
        end

        def to_s
          "PLACEHOLDER: #{@component} - #{@part} - #{@file}"
        end
      end
    end
  end
end

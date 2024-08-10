require 'open3'
require 'weird_phlex/core/project/target_file'

module WeirdPhlex
  module Core
    class Planner

      class Plan
        class CopyAction
          def initialize(source_file, target_file)
            @source_file = source_file
            @target_file = target_file
          end

          def perform!
            @target_file.raw_file.write(@source_file.raw_file.read)
          end

          def to_s
            <<~HEREDOC
              COPY:
                #{@source_file.to_s}
                #{@target_file.to_s}
            HEREDOC
          end
        end

        def initialize(actions = [])
          @actions = []
        end

        attr_reader :actions

        def perform!
          actions.each(&:perform!)
        end

        def to_s
          actions.each { puts _1.to_s }
        end

        def copy(source_file, target_file)
          add(CopyAction.new(source_file, target_file))
        end

        def create(source_file)
          add(
            CopyAction.new(
              source_file,
              WeirdPhlex::Core::Project::TargetFile.from_component_pack_file(source_file)
            )
          )
        end

        def add(action)
          @actions << action
        end
      end

      def self.initial_full_installation_plan
        plan = Plan.new
        # we temporarily assume that the project is still empty
        WeirdPhlex::Core::Indexer
          .component_pack_variants
          .flat_map(&:files)
          .select(&:component_file?)
          .each { plan.create(_1) }

        plan
      end

    end
  end
end

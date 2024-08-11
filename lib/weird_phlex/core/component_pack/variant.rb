require 'open3'

require 'weird_phlex/core/component_pack/component'
require 'weird_phlex/core/component_pack/file'

module WeirdPhlex
  module Core
    module ComponentPack
      class Variant
        LIBRARAY_AND_VARIANT_REGEX = %r{\Aweird_phlex-(?<library>[_\w]+)-(?<variant>[_\w]+)\Z}

        def self.all
          output, error, status = Open3.capture3('bundle', 'list')
          if status.success?
            output
              .lines
              .map { |line| /\s(weird_phlex-[-_\w]+)\s/ =~ line; $1 }
              .compact
              .map{ new(_1) }
          else
            raise "Bundler error:\n#{error}"
          end
        end

        def initialize(name)
          @name = name
          @gem = name
          @gem_path = gem_path(name)
          @library, @variant = library_and_variant(name)
          @component_path = @gem_path.join('lib', 'weird_phlex', @library, @variant)
        end

        def components
          files
            .select(&:component_file?)
            .group_by(&:component)
            .map do |component_name, files|
              WeirdPhlex::Core::ComponentPack::Component.new(component_name, files: files)
            end
        end

        def files
          file_paths.map { WeirdPhlex::Core::ComponentPack::File.new(_1, component_path: @component_path) }
        end

        private

        def file_paths
          Dir['**/*', base: @component_path.to_s].map { @component_path.join(_1) }.select(&:file?)
        end
        
        def gem_path(name)
          path, error, status = Open3.capture3('bundle', 'show', name)
          if status.success?
            Pathname.new(path.strip)
          else
            raise "Bundler error:\n#{error}"
          end
        end

        def library_and_variant(name)
          if matches = name.match(LIBRARAY_AND_VARIANT_REGEX)
            [matches[:library], matches[:variant]]
          else
            raise "Regex error: Could not parse component pack name '#{name}'!"
          end
        end
      end
    end
  end
end

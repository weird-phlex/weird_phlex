require 'open3'
require 'weird_phlex/core/component_pack'

module WeirdPhlex
  module Core
    class Indexer

      def component_packs
        output, error, status = Open3.capture3('bundle', 'list')
        if status.success?
          output
            .lines
            .map { |line| /\s(weird_phlex-[-_\w]+)\s/ =~ line; $1 }
            .compact
            .map{ WeirdPhlex::Core::ComponentPack.new(_1) }
        else
          raise "Bundler error:\n#{error}"
        end
      end

    end
  end
end

require 'open3'

require 'weird_phlex/core/project/file'

module WeirdPhlex
  module Core
    class Project

      def files
        paths = if directories.empty?
          files_in(project_root)
        else
          directories.flat_map do |dir|
            files_in(project_root.join(dir))
          end
        end
        paths.map { WeirdPhlex::Core::Project::File.new(_1, project_path: project_root) }
      end

      private

      # probably needs to be configurable, maybe with presets for Rails, Hanami, Middleman, e.g.
      def directories
        ['app', 'config', 'lib', 'public', 'test', 'vendor']
      end

      # A bit naive
      def project_root
        Pathname.new(Dir.pwd)
      end

      def files_in(root)
        (git_files(root, '--others', '--cached') - git_files(root, '--ignored', '--others', '--cached'))
          .map { root.join(_1) }
          .select(&:file?)
      end

      def git_files(root, *flags)
        file_list, error, status = Open3.capture3(
          'git', 'ls-files', *flags, '--exclude-standard',
          chdir: root.to_s
        )
        if status.success?
          file_list.split(/[\r\n]+/)
        else
          raise "Git error:\n#{error}"
        end
      end
    end
  end
end

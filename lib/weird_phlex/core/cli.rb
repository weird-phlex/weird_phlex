# frozen_string_literal: true

module WeirdPhlex
  module Core
    class CLI < Thor
      class_option :help, type: :boolean, aliases: "h", desc: "Display help for a command"
      map "g" => :generate,
        "l" => :list,
        "d" => :diff,
        "u" => :update

      desc "generate [ARGS]", "generate selected component or -all"
      def generate(*args)
        if args.empty?
          puts "Error: No arguments provided. Use 'weird_phlex help #{__method__}' for more information."
          exit(1)
        end

        WeirdPhlex::Core::Main.generate(args)
      end

      desc "list", "list of all available components, alternatively l"
      def list
        WeirdPhlex::Core::Main.list
      end

      desc "difference", "checks for components that were not installed yet, alternatively d"
      def diff
        WeirdPhlex::Core::Main.diff
      end

      desc "update [ARGS]", "checks if a specific component is up to date or -all. alternatively u"
      def update(*args)
        if args.empty?
          puts "Error: No arguments provided. Use 'weird_phlex help #{__method__}' for more information."
          exit(1)
        end

        WeirdPhlex::Core::Main.update(args)
      end

      def self.exit_on_failure?
        true
      end
    end
  end
end

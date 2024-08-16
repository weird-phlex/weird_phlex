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
          return
        end

        WeirdPhlex::Core::Main::CLIreceiver.generate(args)
      end

      desc "list", "list of all avaible components, alternativelly l"
      def list
        WeirdPhlex::Core::Main::CLIreceiver.list
      end

      desc "difference", "checks for components that were not installed yet, alternativelly d"
      def diff
        WeirdPhlex::Core::Main::CLIreceiver.diff
      end

      desc "update [ARGS]", "checks if a specific component is up to date or -all. alternativelly u"
      def update(*args)
        if args.empty?
          puts "Error: No arguments provided. Use 'weird_phlex help #{__method__}' for more information."
          return
        end

        WeirdPhlex::Core::Main::CLIreceiver.update(args)
      end

      def self.exit_on_failure?
        true
      end
    end
  end
end

module WeirdPhlex
  module Core
    class Main
      def self.full_index_libraries!
        # Build a full index of all loaded libraries that ignores the user-configured
        # library, variant fallbacks and part paths.
      end

      def self.index_libraries!
        # Build the sparse index that only contains the single configured library,
        # one variant per component (with the highest fallback priority) and only
        # the parts that the user actually wants to include.
      end

      def self.full_index_project!
        # Build a full index of all files in the Rails app that contain the
        # magic comment `# weird_phlex: { ... }`.
      end

      def self.index_project!
        # Build the config-aware sparse index of the project that only looks into
        # the configured part directories.
      end

      # entrypoint for user to check libraries for errors
      def self.validate_libraries!
        # Validate all libraries according to our conventions:
        # - file structure
        # - optional rake task or generator for initial setup (at library and/or variant level)
        # - global files, e.g. helpers, concerns
        # - self-imposed guarantees, e.g. each component contains a spec
      end

      # entrypoint for library developer to check own library
      def self.validate_library!(name)
        # Validate a single library according to our conventions. (see above)
      end

      # entrypoint for library-variant developer to check own variant
      def self.validate_variant!(library, variant)
        # Validate a single variant according to our conventions. (see above)
      end

      # entrypoint for user to check Rails project
      def self.validate_project!
        # Validate the whole Rails project according to our conventions:
        # - files with our magic comment only exist in certain directories:
        #   - predefined directories, e.g. helpers, concerns
        #   - user-configured directories
        # - no files without magic comments exist in those directories (maybe opt-out)
        # - only components of a single UI library are in use (maybe opt-out, but would
        #     make generators and update logic more complicated)
        # - the correct variant is in use (according to the variant fallback sequence)
        # - all available components are installed (maybe have ignore-list)
        # - of each component, all parts are installed
        # - validates library-defined guarantees, e.g. certain gem installed, tailwind present
      end

      def self.list_available_themes
        # Output a nicely formatted list of all installed themes.
      end

      def self.list_available_variants(theme)
        # Output a list of all variants for a given theme.
      end

      # entrypoint for user: "update --dry-run"
      def self.outdated_components
        # Assumes project is in valid state (except "all components installed")
        # Computes list of new components and list of upgradeable components
      end

      # entrypoint for user: "update"
      def self.update!
        # Applies all computed upgrades
      end

      # entrypoint for user: "install"
      def self.install!
        # Maybe rake task or generator
        # - install phlex
        # - install phlexible
        # - generate weird_phlex config
        # - library-dependent tasks, e.g.:
        #   - install tailwind
        #   - install simple_form (OR install weird_phlex_forms)
        # - variant-dependent tasks, e.g.:
        #   - all of the above
        #   - install stimulus
        #   - install unpoly
      end

      def self.uninstall_variant!(name)
      end

      def self.uninstall_library!(name)
      end

      def self.pack_library!(name, variant = nil)
        # Future plans:
        # - allow developers of a library or variant (maybe only for variants) to
        #     simply develop their components within a Rails project
        # - then call `pack_library!` and the components get copied in the opposite
        #     direction, from the Rails project into the library/variant gem:
        #     - correctly placed in the file structure
        #     - versions of modified components get bumped
        # - only works, when you mount the component library gem via `gem '<name>', path: '../<name>'`
      end
    end
  end
end


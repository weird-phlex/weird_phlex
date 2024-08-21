# frozen_string_literal: true

require 'yaml'

module WeirdPhlex
  module Core
    module Project
      class Config
        attr_reader :config

        def initialize(config_path = '.weird_phlex.yml')
          @config = YAML.safe_load(::File.read(config_path), symbolize_names: true)
        end

        def part_path(part_name)
          config.dig(:part_paths, part_name.to_sym)
        end

        def shared_part_path(shared_part_name)
          config.dig(:shared_paths, shared_part_name.to_sym)
        end

        def best_variant(*variants)
          config_variants = config[:variants] || []
          variants.find { |v| config_variants.include?(v.to_s) } || variants.first
        end
      end
    end
  end
end


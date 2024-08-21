# frozen_string_literal: true

require "open3"

RSpec.describe "weird_phlex executable" do
  let(:executable) { File.expand_path("../../../bin/weird_phlex", __FILE__) }
  let(:ruby) { RbConfig.ruby }

  def execute_command(*args)
    Open3.capture3(ruby, executable, *args)
  end

  shared_examples "a command requiring arguments" do |command, alias_command|
    it "prints an error when no arguments are provided" do
      stdout, _, status = execute_command(command)
      expect(stdout).to include("Error: No arguments provided")
      expect(status.exitstatus).to eq(1)
    end

    it "executes with provided arguments" do
      stdout, _, status = execute_command(command, "component1")
      expect(stdout).to include("component1")
      expect(status.exitstatus).to eq(0)
    end

    it "recognizes '#{alias_command}' as an alias" do
      stdout, _, status = execute_command(alias_command, "component1")
      expect(stdout).to include("component1")
      expect(status.exitstatus).to eq(0)
    end
  end

  shared_examples "a command without arguments" do |command, alias_command, expected_output|
    it "executes successfully" do
      stdout, _, status = execute_command(command)
      expect(stdout).to include(expected_output)
      expect(status.exitstatus).to eq(0)
    end

    it "recognizes '#{alias_command}' as an alias" do
      stdout, _, status = execute_command(alias_command)
      expect(stdout).to include(expected_output)
      expect(status.exitstatus).to eq(0)
    end
  end

  # describe "generate command" do
  #   include_examples "a command requiring arguments", "generate", "g"
  # end

  describe "list command" do
    include_examples "a command without arguments", "list", "l", "list(l)"
  end

  describe "diff command" do
    include_examples "a command without arguments", "diff", "d", "diff(d)"
  end

  describe "update command" do
    include_examples "a command requiring arguments", "update", "u"
  end

  describe "help option" do
    it "displays help information when --help is used" do
      stdout, _, status = execute_command("--help")
      expect(stdout).to include("Commands:")
      expect(stdout).to include("generate")
      expect(stdout).to include("list")
      expect(stdout).to include("diff")
      expect(stdout).to include("update")
      expect(status.exitstatus).to eq(0)
    end
  end
end
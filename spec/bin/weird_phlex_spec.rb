# frozen_string_literal: true

require "open3"

RSpec.describe "weird_phlex executable" do
  let(:executable) { File.expand_path("../../../bin/weird_phlex", __FILE__) }
  let(:ruby) { RbConfig.ruby }

  describe "generate command" do
    it "prints an error when no arguments are provided" do
      stdout, _, _ = Open3.capture3(ruby, executable, "generate")
      expect(stdout).to include("Error: No arguments provided")
    end

    it "calls generate with provided arguments" do
      stdout, _, status = Open3.capture3(ruby, executable, "generate", "component1")
      expect(stdout).to include("component1")
      expect(status.exitstatus).to eq(0)
    end
  end

  describe "list command" do
    it "calls list method" do
      stdout, _, status = Open3.capture3(ruby, executable, "list")
      expect(stdout).to include("list(l)")
      expect(status.exitstatus).to eq(0)
    end
  end

  describe "diff command" do
    it "calls diff method" do
      stdout, _, status = Open3.capture3(ruby, executable, "diff")
      expect(stdout).to include("diff(d)")
      expect(status.exitstatus).to eq(0)
    end
  end

  describe "update command" do
    it "prints an error when no arguments are provided" do
      stdout, _, _ = Open3.capture3(ruby, executable, "update")
      expect(stdout).to include("Error: No arguments provided")
    end

    it "calls update with provided arguments" do
      stdout, _, status = Open3.capture3(ruby, executable, "update", "component1")
      expect(stdout).to include("component1")
      expect(status.exitstatus).to eq(0)
    end
  end

  describe "command aliases" do
    it "recognizes 'g' as an alias for 'generate'" do
      stdout, _, status = Open3.capture3(ruby, executable, "g", "component1")
      expect(stdout).to include("component1")
      expect(status.exitstatus).to eq(0)
    end

    it "recognizes 'l' as an alias for 'list'" do
      stdout, _, status = Open3.capture3(ruby, executable, "l")
      expect(stdout).to include("list(l)")
      expect(status.exitstatus).to eq(0)
    end

    it "recognizes 'd' as an alias for 'diff'" do
      stdout, _, status = Open3.capture3(ruby, executable, "d")
      expect(stdout).to include("diff(d)")
      expect(status.exitstatus).to eq(0)
    end

    it "recognizes 'u' as an alias for 'update'" do
      stdout, _, status = Open3.capture3(ruby, executable, "u", "component1")
      expect(stdout).to include("component1")
      expect(status.exitstatus).to eq(0)
    end
  end

  describe "help option" do
    it "displays help information when --help is used" do
      stdout, _, status = Open3.capture3(ruby, executable, "--help")
      expect(stdout).to include("Commands:")
      expect(stdout).to include("generate")
      expect(stdout).to include("list")
      expect(stdout).to include("diff")
      expect(stdout).to include("update")
      expect(status.exitstatus).to eq(0)
    end
  end
end

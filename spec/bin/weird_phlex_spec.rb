load File.expand_path("../../../bin/weird_phlex", __FILE__) # load executable bin/weird_phlex file

RSpec.describe WeirdPhlex::CLI do
  let(:cli) { described_class.new }

  before do
    allow(WeirdPhlex::Core::Main).to receive(:generate)
    allow(WeirdPhlex::Core::Main).to receive(:list)
    allow(WeirdPhlex::Core::Main).to receive(:diff)
    allow(WeirdPhlex::Core::Main).to receive(:update)
  end

  describe "#generate" do
    it "calls generate method with provided arguments" do
      cli.invoke(:generate, ["component_name"])
      expect(WeirdPhlex::Core::Main).to have_received(:generate).with(["component_name"])
    end

    it "displays error when no arguments are provided" do
      expect { cli.invoke(:generate) }.to output(/Error: No arguments provided/).to_stdout
    end
  end

  describe "#list" do
    it "calls list method" do
      cli.invoke(:list)
      expect(WeirdPhlex::Core::Main).to have_received(:list)
    end
  end

  describe "#diff" do
    it "calls diff method" do
      cli.invoke(:diff)
      expect(WeirdPhlex::Core::Main).to have_received(:diff)
    end
  end

  describe "#update" do
    it "calls update method with provided arguments" do
      cli.invoke(:update, ["component_name"])
      expect(WeirdPhlex::Core::Main).to have_received(:update).with(["component_name"])
    end

    it "displays error when no arguments are provided" do
      expect { cli.invoke(:update) }.to output(/Error: No arguments provided/).to_stdout
    end
  end

  describe "thor integration" do
    it "sets up correct command mappings" do
      expect(described_class.commands["generate"].name).to eq("generate")
      expect(described_class.commands["list"].name).to eq("list")
      expect(described_class.commands["diff"].name).to eq("diff")
      expect(described_class.commands["update"].name).to eq("update")
    end

    it "sets up correct aliases" do
      expect(described_class.map["g"]).to eq(:generate)
      expect(described_class.map["-l"]).to eq(:list)
      expect(described_class.map["-d"]).to eq(:diff)
      expect(described_class.map["-u"]).to eq(:update)
    end
  end
end

require "rspec"
require "open3"

RSpec.describe "wph alias" do
  let(:weird_phlex_path) { File.expand_path("../../../bin/weird_phlex", __FILE__) }
  let(:wph_path) { File.expand_path("../../../bin/wph", __FILE__) }

  it "runs the #generate command with wph and weird_phlex and compares outputs" do
    wph_output, wph_status = Open3.capture2("ruby #{wph_path} generate component_name")
    weird_phlex_output, weird_phlex_status = Open3.capture2("ruby #{weird_phlex_path} generate component_name")

    expect(wph_status.exitstatus).to eq(weird_phlex_status.exitstatus)
    expect(wph_output).to eq(weird_phlex_output)
  end

  it "runs the #list command with wph and weird_phlex and compares outputs" do
    wph_output, wph_status = Open3.capture2("ruby #{wph_path} list")
    weird_phlex_output, weird_phlex_status = Open3.capture2("ruby #{weird_phlex_path} list")

    expect(wph_status.exitstatus).to eq(weird_phlex_status.exitstatus)
    expect(wph_output).to eq(weird_phlex_output)
  end

  it "runs the #diff command with wph and weird_phlex and compares outputs" do
    wph_output, wph_status = Open3.capture2("ruby #{wph_path} diff")
    weird_phlex_output, weird_phlex_status = Open3.capture2("ruby #{weird_phlex_path} diff")

    expect(wph_status.exitstatus).to eq(weird_phlex_status.exitstatus)
    expect(wph_output).to eq(weird_phlex_output)
  end

  it "runs the #update command with wph and weird_phlex and compares outputs" do
    wph_output, wph_status = Open3.capture2("ruby #{wph_path} update component_name")
    weird_phlex_output, weird_phlex_status = Open3.capture2("ruby #{weird_phlex_path} update component_name")

    expect(wph_status.exitstatus).to eq(weird_phlex_status.exitstatus)
    expect(wph_output).to eq(weird_phlex_output)
  end
end

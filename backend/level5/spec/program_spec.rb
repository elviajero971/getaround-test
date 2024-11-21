RSpec.describe 'main.rb' do
  require 'fileutils'
  require 'json'

  let(:input_path) { 'spec/input.json' }
  let(:expected_output_path) { 'spec/expected_output.json' }
  let(:data_input_path) { 'data/input.json' }
  let(:data_output_path) { 'data/output.json' }
  let(:spec_output_path) { 'spec/output.json' }

  before do
    # Create symbolic links for data files to redirect to spec files
    FileUtils.mkdir_p('data')
    FileUtils.ln_sf(File.expand_path(input_path), data_input_path)
    FileUtils.rm_f(data_output_path) # Remove any existing output

    # Ensure spec output is cleaned up
    File.delete(spec_output_path) if File.exist?(spec_output_path)
  end

  after do
    # Clean up links and output files
    FileUtils.rm_f(data_input_path)
    FileUtils.rm_f(data_output_path)
    File.delete(spec_output_path) if File.exist?(spec_output_path)
  end

  it 'processes input.json and creates output.json with the right data' do
    # Run the main.rb script
    system('ruby main.rb')

    # Verify that the output file is generated
    expect(File.exist?(data_output_path)).to be true

    # Copy the output to spec directory for comparison
    FileUtils.cp(data_output_path, spec_output_path)

    # Load and compare contents
    expected_output_content = JSON.parse(File.read(expected_output_path))
    output_content = JSON.parse(File.read(spec_output_path))
    expect(output_content).to eq(expected_output_content)
  end
end

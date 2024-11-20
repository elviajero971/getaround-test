require 'json'

class DataParser
  def self.parse_input(file_path:)
    data = JSON.parse(File.read(file_path))
    { cars: data['cars'], rentals: data['rentals'] }
  end

  def self.write_output(file_path:, data:)
    File.open(file_path, 'w') do |file|
      file.write(JSON.pretty_generate(data))
    end
  end
end
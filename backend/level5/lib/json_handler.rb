require 'json'

class JsonHandler
  def self.parse_file(file_path)
    JSON.parse(File.read(file_path))
  end

  def self.write_file(file_path, data)
    File.write(file_path, JSON.pretty_generate(data))
  end
end

require 'json'

module Json
  class DataWriteOutputFile

    def self.perform(file_path:, data:)
      File.open(file_path, 'w') do |file|
        file.write(JSON.pretty_generate(data))
      end
    end
  end
end

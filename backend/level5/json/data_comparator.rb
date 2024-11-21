# frozen_string_literal: true

module Json
  require 'json'
  class DataComparator
    def self.perform(file_path:, expected_file_path:)
      file = JSON.parse(File.read(file_path))
      expected_file = JSON.parse(File.read(expected_file_path))

      if file == expected_file
        puts 'Files output.json and expected_output.json has been compared and are identical.'
      else
        puts 'Files output.json and expected_output.json has been compared and are different.'
      end
    end
  end
end

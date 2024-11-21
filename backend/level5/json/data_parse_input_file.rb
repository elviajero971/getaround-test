# frozen_string_literal: true

require 'json'

module Json
  class DataParseInputFile
    def self.perform(file_path:)
      data = JSON.parse(File.read(file_path))
      { cars: data['cars'], rentals: data['rentals'], options: data['options'] }
    end
  end
end

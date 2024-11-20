require 'json'

module Json
  class DataParseInputFile
    def self.perform(file_path:)
      data = JSON.parse(File.read(file_path))
      { cars: data['cars'], rentals: data['rentals'] }
    end
  end
end

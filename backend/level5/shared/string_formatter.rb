# frozen_string_literal: true

module Shared
  class StringFormatter
    def self.transform(string)
      raise ArgumentError, 'String cannot be empty' if string.empty?
      raise ArgumentError, 'This is not a string' unless string.is_a?(String)

      string.split('_').map(&:capitalize).join
    end
  end
end

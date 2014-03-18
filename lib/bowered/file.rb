require 'bowered/forwarder'

module Bowered
  class File

    include Forwarder.new(:path, kind: Pathname)

    def self.[](*array)
      File.new(::Pathname.new(*array.flatten))
    end

    def inspect
      "Bowered::File[#{to_s.inspect}]"
    end

  end
end

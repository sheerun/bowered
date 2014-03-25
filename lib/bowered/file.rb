require 'bowered/forwarder'

module Bowered
  class File

    include Forwarder.new(:path, kind: ::Pathname)

    def self.[](*path)
      File.new(::Pathname.new(::File.join(*path)).cleanpath)
    end

    def inspect
      "Bowered::File[#{to_s.inspect}]"
    end

  end
end

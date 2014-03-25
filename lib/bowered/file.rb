require 'bowered/forwarder'
require 'tmpdir'

module Bowered
  class File

    include Forwarder.new(:path, kind: ::Pathname)

    def self.[](*path)
      File.new(::Pathname.new(::File.join(*path)).cleanpath)
    end

    def inspect
      "Bowered::File[#{to_s.inspect}]"
    end

    def self.mktmpdir
      if block_given?
        ::Dir.mktmpdir do |dir|
          yield File[dir]
        end
      else
        File[::Dir.mktmpdir]
      end
    end

  end
end

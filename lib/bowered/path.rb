require 'bowered/forwarder'
require 'tmpdir'

module Bowered
  class Path

    include Forwarder.new(:path, kind: Pathname)

    def self.[](*path)
      Path.new(Pathname.new(File.join(*path)).cleanpath)
    end

    def inspect
      "Bowered::Path[#{to_s.inspect}]"
    end

    def self.mktmpdir
      if block_given?
        Dir.mktmpdir do |dir|
          yield Path[dir]
        end
      else
        Path[Dir.mktmpdir]
      end
    end

  end
end

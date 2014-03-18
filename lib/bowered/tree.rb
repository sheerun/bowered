require 'hamster/set'
require 'bowered/forwarder'

module Bowered

  class Tree

    include Forwarder.new(:paths, kind: Hamster::Set)

    def self.[](*array)
      Tree.new(Hamster.set(*array.flatten.map { |e| File[e] } ))
    end

    def inspect
      "Bowered::Tree#{paths.to_a.map(&:to_s).sort.inspect}"
    end

  end
end

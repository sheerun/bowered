require 'charlatan'

module Bowered

  class Forwarder < Module
    def initialize(name, options = {})
      include Charlatan.new(name, options)

      define_method(:eql?) do |other|
        instance_of?(other.class) &&
          __proxy_target__.eql?(other.__proxy_target__)
      end

      define_method(:==) do |other|
        eql?(other)
      end

      define_method(:hash) do
        @hash ||= __proxy_target__.hash
      end

      define_method(:to_s) do
        __proxy_target__.to_s
      end

    end
  end

end

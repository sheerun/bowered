require 'spec_helper'
require 'hamster/set'

module Bowered

  describe Forwarder do

    before(:each) do
      class Sample
        include Forwarder.new(:name)
      end

      @path1 = Sample.new(Pathname.new('/tmp'))
      @path2 = Sample.new(Pathname.new('/tmp'))
    end

    it 'forwards eql? to object inside' do
      expect(@path1).to eq(@path2)
    end

    it 'forwards == to object inside' do
      expect(@path1).to eq(@path2)
    end

    it 'forwards to_s to object inside' do
      expect("#{@path1}").to eq("#{@path2}")
    end

    it 'forwards hash to object inside' do
      # Hamster::Set uses object.hash to index them in tree
      expect(Hamster.set(@path1)).to eq(Hamster.set(@path2))
    end
  end

end

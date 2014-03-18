require 'spec_helper'

module Bowered

  describe File do

    it 'responds to Pathname methods' do
      expect(File['/tmp'].exist?).to be_true
    end

    it 'returns instance of File for Pathname methods' do
      expect(File['foo'].join('bar')).to eq(File['foo/bar'])
    end

    it 'inspected value evals to equivalent object' do
      expect(eval(File['bar'].inspect)).
        to eq(File['bar'])
    end

    it 'accepts File class as Pathname method parameters' do
      expect(File['foo'].join(File['bar'])).to eq(File['foo/bar'])
    end


    describe '#==' do

      it 'can be compared to itself' do
        expect(File['foo']).to eq(File['foo'])
      end

      it 'can be compared to other files' do
        expect(File['foo']).to eq(File['foo'])
      end

    end

    describe '#to_s' do

      it 'retuns just simple path' do
        expect(File['foo/bar'].to_s).to eq('foo/bar')
      end

    end

  end

end

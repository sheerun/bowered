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

    it 'is idempotent' do
      expect(File[File['bar']]).to eq(File['bar'])
    end

    it 'can accept Pathname' do
      expect(File[Pathname.new('bar')]).to eq(File['bar'])
    end

    it 'can accept array' do
      expect(File['./foo', 'bar']).to eq(File['foo/bar'])
    end

    describe '#==' do

      it 'can be compared to itself' do
        expect(File['foo']).to eq(File['foo'])
      end

      it 'can be compared to other files' do
        expect(File['foo']).to eq(File['foo'])
      end

      it 'ignores ./ at the beginning' do
        expect(File['foo']).to eq(File['./foo'])
      end
    end

    describe '#to_s' do

      it 'retuns just simple path' do
        expect(File['foo/bar'].to_s).to eq('foo/bar')
      end

    end

    describe ".mktmpdir" do

      it 'returns instance of File' do
        expect(File.mktmpdir).to be_a(File)
      end

      it 'yields instance of File' do
        File.mktmpdir do |dir|
          expect(dir).to be_a(File)
        end
      end

      it 'creates directory on filesystem' do
        File.mktmpdir do |dir|
          expect(dir.exist?).to be_true
        end
      end

    end

  end

end

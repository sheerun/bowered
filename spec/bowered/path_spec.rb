require 'spec_helper'

module Bowered

  describe Path do

    it 'responds to Pathname methods' do
      expect(Path['/tmp'].exist?).to be_true
    end

    it 'returns instance of Path for Pathname methods' do
      expect(Path['foo'].join('bar')).to eq(Path['foo/bar'])
    end

    it 'inspected value evals to equivalent object' do
      expect(eval(Path['bar'].inspect)).
        to eq(Path['bar'])
    end

    it 'accepts Path class as Pathname method parameters' do
      expect(Path['foo'].join(Path['bar'])).to eq(Path['foo/bar'])
    end

    it 'is idempotent' do
      expect(Path[Path['bar']]).to eq(Path['bar'])
    end

    it 'can accept Pathname' do
      expect(Path[Pathname.new('bar')]).to eq(Path['bar'])
    end

    it 'can accept array' do
      expect(Path['./foo', 'bar']).to eq(Path['foo/bar'])
    end

    describe '#==' do

      it 'can be compared to itself' do
        expect(Path['foo']).to eq(Path['foo'])
      end

      it 'can be compared to other files' do
        expect(Path['foo']).to eq(Path['foo'])
      end

      it 'ignores ./ at the beginning' do
        expect(Path['foo']).to eq(Path['./foo'])
      end
    end

    describe '#to_s' do

      it 'retuns just simple path' do
        expect(Path['foo/bar'].to_s).to eq('foo/bar')
      end

    end

    describe ".mktmpdir" do

      it 'returns instance of Path' do
        expect(Path.mktmpdir).to be_a(Path)
      end

      it 'yields instance of Path' do
        Path.mktmpdir do |dir|
          expect(dir).to be_a(Path)
        end
      end

      it 'creates directory on filesystem' do
        Path.mktmpdir do |dir|
          expect(dir.exist?).to be_true
        end
      end

    end

  end

end

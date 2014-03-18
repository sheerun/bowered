require 'spec_helper'

module Bowered

  describe Tree do

    it 'responds to Set methods' do
      expect(Tree['foo'].subset?(Tree['bar'])).to be(false)
    end

    it 'behaves like set' do
      expect(Tree['foo', 'foo/bar']).to eq(Tree['foo/bar', 'foo'])
    end

    it 'returns instance of Tree for set methods' do
      expect(Tree['foo'] + Tree['bar']).to be_a(Tree)
    end

    it 'inspected value evals to equivalent object' do
      expect(eval(Tree['bar', 'foo'].inspect)).
        to eq(Tree['bar', 'foo'])
    end

  end

end

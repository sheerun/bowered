require 'spec_helper'

describe Bowered do
  it 'loads api interface when required' do
    expect(Bowered::VERSION).to be_a(String)
  end
end

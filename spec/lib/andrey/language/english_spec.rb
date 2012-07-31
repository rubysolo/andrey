require 'spec_helper'
require 'andrey/language/english'

describe Andrey::Language::English do
  let(:described_class) { Andrey::Language::English }

  it 'knows the english alphabet' do
    described_class.symbols.must_equal ('a'..'z').to_a
  end

  it 'knows the trained bigram freqency' do
    map = described_class.probability_map
    map.length.must_equal 26
    map.each { |row| row.length.must_equal 26 }
  end
end

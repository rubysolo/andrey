require 'spec_helper'
require 'andrey/language/dynamic'

describe Andrey::Language::Dynamic do
  let(:described_class) { Andrey::Language::Dynamic }

  it 'takes symbols array and probability map' do
    sym, map = ['a', 'b', 'c'], [[1, 2, 3]]
    lang = described_class.new(sym, map)
    lang.symbols.must_equal sym
    lang.probability_map.must_equal map
  end
end

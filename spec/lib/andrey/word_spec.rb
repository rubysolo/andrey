require 'spec_helper'
require 'andrey/word'

class TestLanguage
  def self.symbols
    ('a'..'z').to_a
  end

  def self.probability_map
    @map ||= begin
      inner = (0..25).map { |index| 0 }
      outer = (0..25).map { |index| inner }
      outer[0][1] = 1
      outer
    end
  end
end

describe Andrey::Word do
  it 'generates a word based on letter frequencies' do
    Andrey::Word.generate().length.must_equal 8
  end

  it 'picks a next letter, based on probability' do
    word = Andrey::Word.new(TestLanguage)
    word.next_letter('a').must_equal 'b'
  end
end

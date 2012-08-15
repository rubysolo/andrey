require 'spec_helper'
require 'andrey/analyzer'

describe Andrey::Analyzer do
  let(:subject) { Andrey::Analyzer }

  it 'counts occurrences of bigrams in source text' do
    symbols, map = subject.analyze_text("abc")

    freq_a = map[0]
    freq_a.must_equal [0, 1, 0]

    freq_b = map[1]
    freq_b.must_equal [0, 0, 1]

    freq_c = map[2]
    freq_c.must_equal [0, 0, 0]
  end

  it 'reads corpus text from a file' do
    IO.stubs(:read).returns("abc")
    subject.analyze_file("filename.txt")
  end
end

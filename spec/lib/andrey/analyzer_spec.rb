require 'spec_helper'
require 'andrey/analyzer'

describe Andrey::Analyzer do
  let(:subject) { Andrey::Analyzer.new }

  it 'counts occurrences of bigrams in source text' do
    zeros  = (0..25).map { |x| 0 }
    result = subject.analyze("abc")

    freq_a = result[0]
    freq_a.must_equal zeros.dup.fill(1,1,1)

    freq_b = result[1]
    freq_b.must_equal zeros.dup.fill(1,2,1)

    freq_c = result[2]
    freq_c.must_equal zeros
  end

  it 'reads corpus text from a file' do
    IO.stubs(:read).returns("abc")
    subject.expects(:analyze).with("abc")
    subject.read("filename.txt")
  end
end

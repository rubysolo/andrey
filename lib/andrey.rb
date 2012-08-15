require "andrey/analyzer"
require "andrey/version"
require "andrey/word"

module Andrey
  def self.analyze_file(*args)
    Analyzer.analyze_file(*args)
  end

  def self.analyze_text(*args)
    Analyzer.analyze_text(*args)
  end

  def self.generate(*args)
    Word.generate(*args)
  end
end

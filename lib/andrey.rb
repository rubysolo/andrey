require "andrey/analyzer"
require "andrey/version"
require "andrey/word"

module Andrey
  def self.analyze(*args)
    Analyzer.analyze(*args)
  end

  def self.generate(*args)
    Word.generate(*args)
  end
end

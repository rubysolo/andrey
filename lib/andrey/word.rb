module Andrey
  class Word
    def initialize(language=Language::English)
      @language = language
      @word = []
    end

    def to_s
      @word.join
    end

    def length
      @word.length
    end

    def add_letter
      @word << next_letter(@word.last || symbols.sample)
    end

    def next_letter(letter)
      index = symbols.index(letter)

      probabilities = probability_map[index]
      pointer = rand(probabilities.inject(:+))
      sum = 0

      probabilities.each_with_index do |p, index|
        if p > 0
          sum += p
          return symbols[index] if sum > pointer
        end
      end

      symbols.sample
    end

    def self.generate(length=8)
      new.tap do |word|
        while word.length < length
          word.add_letter
        end
      end
    end

    private

    def symbols
      @language.symbols
    end

    def probability_map
      @language.probability_map
    end
  end
end

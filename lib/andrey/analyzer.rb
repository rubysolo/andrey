module Andrey
  class Analyzer
    def analyze(text)
      symbols = ('a'..'z').to_a
      zeros = [].fill(0,0,26)
      map   = (0..25).to_a.map { |x| zeros.dup }

      text.downcase.split(/[^a-z]+/).each do |word|
        word.split(//).each_cons(2) do |from, to|
          col = symbols.index(from)
          row = symbols.index(to)

          map[col][row] += 1
        end
      end

      map
    end
  end
end

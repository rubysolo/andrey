module Andrey
  class Analyzer
    def self.analyze_file(filename)
      analyze_text IO.read(filename)
    end

    def self.analyze_text(text)
      pmap = {}

      text.downcase.chars.each_cons(2) do |from, to|
        pmap[from] ||= Hash.new(0)
        pmap[to] ||= Hash.new(0)
        pmap[from][to] += 1
      end

      symbols = pmap.keys.sort.select {|s| s.match(/\w/) }

      map = symbols.inject([]) do |m, symbol|
        probabilities = pmap[symbol]
        m << symbols.map { |s| probabilities[s] }
      end

      [symbols, map]
    end
  end
end

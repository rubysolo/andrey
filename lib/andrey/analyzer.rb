module Andrey
  class Analyzer
    def self.analyze_file(filename, include_spaces=false)
      analyze_text(IO.read(filename), include_spaces)
    end

    def self.analyze_text(text, include_spaces=false)
      pmap = {}

      text.downcase.chars.each_cons(2) do |from, to|
        pmap[from] ||= Hash.new(0)
        pmap[to] ||= Hash.new(0)
        pmap[from][to] += 1
      end

      regex   = symbols_regex(include_spaces)
      symbols = pmap.keys.sort.select {|s| s.match(regex) }

      map = symbols.inject([]) do |m, symbol|
        occurrences = pmap[symbol]
        sum = occurrences.values.inject(:+) || 0
        m << symbols.map { |s| sum == 0 ? 0 : (occurrences[s] / sum.to_f) }
      end

      [symbols, map]
    end

    def self.symbols_regex(include_spaces)
      include_spaces ? Regexp.new(/[a-z ]/) : Regexp.new(/[a-z]/)
    end
  end
end

require 'andrey/analyzer'
require 'andrey/word'

module Andrey
  class Command
    class Generate
      def run(*args)
        # turn cli stuffs into ruby stuffs
        options = []
        args.each_cons(2) do |(flag, value)|
          options << value.to_i if flag == '-l'
        end

        puts Andrey::Word.generate(*options)
      end
    end

    class Analyze
      def run(*args)
        probability_map = Andrey::Analyzer.new.read(args.first)
        puts "["
        probability_map.each_with_index do |row, index|
          print "[#{ row.join(',') }]"
          print "," if index < 25
          puts
        end
        puts "]"
      end
    end

    def self.[](command)
      case command
      when /^gen/i
        Generate.new
      when /^ana/i
        Analyze.new
      else
        raise "unknown command #{ command }"
      end
    end
  end
end

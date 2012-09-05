require 'andrey/analyzer'
require 'andrey/word'

module Andrey
  class Command
    class Generate
      def run(*args)
        # turn cli stuffs into ruby stuffs
        options = {}
        args.each_cons(2) do |(flag, value)|
          options[:length] = value.to_i if flag == '-l'
          options[:language] = language_class(value) if flag == '-m'
          options[:corpus] = value if flag == '-c'
        end

        puts Andrey::Word.generate(options)
      end

      def language_class(filename)
        absolute = if filename.match(%r{^/})
          filename
        else
          File.expand_path(filename, Dir.pwd)
        end

        require absolute
        classname = File.basename(filename, '.rb').split('_').map(&:capitalize).join
        Andrey::Language.const_get(classname)
      end
    end

    class Analyze
      def run(*args)
        symbols, probability_map = Andrey::Analyzer.analyze_file(args.first)
        puts "[#{ symbols.map{|s| "'#{ s }'" }.join(',') }]"

        puts "["
        probability_map.each_with_index do |row, index|
          print "[#{ row.map { |v| sprintf('%.04f',v) }.join(',') }]"
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

require 'andrey/analyzer'
require 'andrey/word'

module Andrey
  class Command
    class Generate
      def run(*args)
        puts Andrey::Word.generate
      end
    end

    def self.[](command)
      case command
      when /^gen/i
        Generate.new
      else
        raise "unknown command #{ command }"
      end
    end
  end
end

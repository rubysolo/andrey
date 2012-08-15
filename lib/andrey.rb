require "andrey/version"
require "andrey/command"

module Andrey
  def self.method_missing(meth, *args)
    Andrey::Command[meth.to_s].run(*args)
  end
end

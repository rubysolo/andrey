require 'spec_helper'
require 'andrey'

describe Andrey do
  it 'delegates generate to the appropriate command' do
    Andrey::Word.expects(:generate)
    Andrey.generate
  end
end

require 'spec_helper'
require 'andrey/command'

describe Andrey::Command do
  let(:described_class) { Andrey::Command }

  it 'generates a random word' do
    Andrey::Command::Generate.any_instance.expects(:puts).returns(nil)
    command = described_class['generate']
    command.run
  end
end

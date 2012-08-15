require 'spec_helper'
require 'andrey/command'

describe Andrey::Command do
  let(:described_class) { Andrey::Command }

  it 'generates a random word' do
    Andrey::Command::Generate.any_instance.expects(:puts).returns(nil)
    command = described_class['generate']
    command.run
  end

  it 'passes arguments to the subcommand' do
    Andrey::Command::Generate.any_instance.stubs(:puts)
    Andrey::Word.expects(:generate).with(10)
    command = described_class['generate']
    command.run('-l', '10')
  end
end

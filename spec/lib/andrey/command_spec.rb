require 'spec_helper'
require 'andrey/command'

describe Andrey::Command do
  let(:described_class) { Andrey::Command }

  it 'generates a random word' do
    Andrey::Command::Generate.any_instance.expects(:puts).returns(nil)
    command = described_class['generate']
    command.run
  end

  it 'passes length args to the subcommand' do
    Andrey::Command::Generate.any_instance.stubs(:puts)
    Andrey::Word.expects(:generate).with(length: 10)
    command = described_class['generate']
    command.run('-l', '10')
  end

  it 'passes probability map args to the subcommand' do
    Andrey::Command::Generate.any_instance.stubs(:puts)
    Andrey::Word.expects(:generate).with(language: Andrey::Language::AmericanNames)
    command = described_class['generate']
    command.run('-m', 'lib/andrey/language/american_names.rb')
  end

  it 'can generate probability maps on the fly' do
    IO.stubs(:read).returns('a quick brown fox jumped over the lazy dog')
    Andrey::Command::Generate.any_instance.stubs(:puts)
    Andrey::Word.expects(:generate).with(corpus: 'textfile.txt')
    command = described_class['generate']
    command.run('-c', 'textfile.txt')
  end
end

require "./lib/command/find_book_command"
require "command_parser"

RSpec.describe CommandParser do
  subject { CommandParser.new }

  describe 'execute' do
    it 'can call FindBookCommand#find_book' do
      command = 'find_book'
      args = []
      expect(subject.execute(command, args)).to eq "Book not found!"
    end
  end
end
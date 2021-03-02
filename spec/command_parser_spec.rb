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

    it 'can call BuildLibraryCommand#build_library' do
        command = 'build_library'
        args = [1, 1, 1]
        expect(subject.execute(command, args)).to eq "Shelf 1 with 1 row and 1 column is added"
    end
  end
end
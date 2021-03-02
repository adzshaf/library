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

    it 'can call PutBookCommand#put_book' do
        command = 'put_book'
        args = [1, 1, 1]
        expect(subject.execute(command, args)).to eq "Allocated address: 010101"
    end

    it 'can call TakeBookCommand' do
      command = 'take_book_from'
      args = ["010101"]
      expect(subject.execute(command, args)).to eq "Slot 010101 is free"
    end

    it 'can call SearchTitleCommand' do
      command = 'search_books_by_title'
      args = ["Harry"]
      expect(subject.execute(command, args)).to eq "Book not found!"
    end
  end
end
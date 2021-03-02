# frozen_string_literal: true

require 'command/find_book_command'
require 'library'

RSpec.describe FindBookCommand do
  context 'execute' do
    subject { FindBookCommand.new }

    it 'should call library#find_book' do
      args = [1]
      expect_any_instance_of(Library).to receive(:find_book).with(args[0]).and_return('Book not found!')
      expect(subject.execute(args)).to eq 'Book not found!'
    end
  end
end

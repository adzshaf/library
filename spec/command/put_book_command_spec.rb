# frozen_string_literal: true

require 'command/put_book_command'
require 'library'

RSpec.describe PutBookCommand do
  context 'execute' do
    subject { PutBookCommand.new }

    it 'should call library#put_book' do
      args = [123_456_789_010, 'Harry Potter', 'J. K. Rowling']
      expect_any_instance_of(Library).to receive(:put_book).with(args[0], args[1],
                                                                 args[2]).and_return('Allocated address: 010101')
      expect(subject.execute(args)).to eq 'Allocated address: 010101'
    end
  end
end

# frozen_string_literal: true

require 'command/search_title_command'
require 'library'

RSpec.describe SearchTitleCommand do
  context 'execute' do
    subject { SearchTitleCommand.new }

    it 'should call library#search_book_by_title' do
      args = ['Harry Potter']
      expect_any_instance_of(Library).to receive(:search_book_by_title).with(args[0]).and_return('010101: 9780747532744 | Harry Potter | J. K. Rowling')
      expect(subject.execute(args)).to eq '010101: 9780747532744 | Harry Potter | J. K. Rowling'
    end
  end
end

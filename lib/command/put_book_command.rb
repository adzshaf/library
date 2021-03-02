# frozen_string_literal: true

require_relative 'command'
require_relative '../library'

class PutBookCommand < Command
  def execute(args)
    isbn = args[0]
    title = args[1]
    author = args[2]

    Library.instance.put_book(isbn, title, author)
  end
end

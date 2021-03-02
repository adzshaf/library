# frozen_string_literal: true

require_relative 'command'
require_relative '../library'

class SearchAuthorCommand < Command
  def execute(args)
    author = args[0]

    Library.instance.search_book_by_author(author)
  end
end

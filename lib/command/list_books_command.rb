# frozen_string_literal: true

require_relative 'command'
require_relative '../library'

class ListBooksCommand < Command
  def execute(_args)
    Library.instance.list_books
  end
end

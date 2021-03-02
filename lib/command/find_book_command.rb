# frozen_string_literal: true

require_relative 'command'
require_relative '../library'

class FindBookCommand < Command
  def execute(args)
    position = args[0]

    Library.instance.find_book(position)
  end
end

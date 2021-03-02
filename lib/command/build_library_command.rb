# frozen_string_literal: true

require_relative 'command'
require_relative '../library'

class BuildLibraryCommand < Command
  def execute(args)
    no_shelf = args[0]
    row = args[1]
    column = args[2]

    Library.instance.build_library(no_shelf, row, column)
  end
end

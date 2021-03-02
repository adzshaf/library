# frozen_string_literal: true

require_relative 'command'

class ExitCommand < Command
  def execute(_args)
    exit
  end
end

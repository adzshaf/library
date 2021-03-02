# frozen_string_literal: true

class Command
  def execute(_args)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

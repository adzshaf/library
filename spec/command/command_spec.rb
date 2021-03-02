# frozen_string_literal: true

require 'command/command'

RSpec.describe Command do
  context 'execute' do
    subject { Command.new }

    it 'should raise error' do
      expect { subject.execute('Test') }.to raise_error { NotImplementedError }
    end
  end
end

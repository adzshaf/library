# frozen_string_literal: true

require 'command/build_library_command'
require 'library'

RSpec.describe BuildLibraryCommand do
  context 'execute' do
    subject { BuildLibraryCommand.new }

    it 'should call library#build_library' do
      args = [1, 1, 1]
      expect_any_instance_of(Library).to receive(:build_library).with(args[0], args[1],
                                                                      args[2]).and_return('Shelf 1 with 1 row and 1 column is added')
      expect(subject.execute(args)).to eq 'Shelf 1 with 1 row and 1 column is added'
    end
  end
end

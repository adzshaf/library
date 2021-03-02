require 'command/take_book_command'
require 'library'

RSpec.describe TakeBookCommand do
    context "execute" do
        subject { TakeBookCommand.new }

        it "should call library#take_book_from" do
            args = ["010101"]
            expect_any_instance_of(Library).to receive(:take_book_from).with(args[0]).and_return("Book not found!")
            expect(subject.execute(args)).to eq "Book not found!"
        end
    end
end
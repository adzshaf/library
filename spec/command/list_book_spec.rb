require 'command/list_books_command'
require 'library'

RSpec.describe ListBooksCommand do
    context "execute" do
        subject { ListBooksCommand.new }

        it "should call library#list_books" do
            args = []
            expect_any_instance_of(Library).to receive(:list_books).and_return("There is no book!")
            expect(subject.execute(args)).to eq "There is no book!"
        end
    end
end
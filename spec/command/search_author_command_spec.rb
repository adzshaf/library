require 'command/search_author_command'
require 'library'

RSpec.describe SearchAuthorCommand do
    context "execute" do
        subject { SearchAuthorCommand.new }

        it "should call library#search_book_by_author" do
            args = ["J. K. Rowling"]
            expect_any_instance_of(Library).to receive(:search_book_by_author).with(args[0]).and_return("010101: 9780747532744 | Harry Potter | J. K. Rowling")
            expect(subject.execute(args)).to eq "010101: 9780747532744 | Harry Potter | J. K. Rowling"
        end
    end
end
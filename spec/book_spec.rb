require 'book'

RSpec.describe Book do
    let(:isbn) { 9780747532744 }
    let(:title) { 'Harry Potter' }
    let(:author) { 'J. K. Rowling' }

    subject { Book.new isbn, title, author }

    context "initialize" do
        it "should be able to get isbn, title, author" do
            expect(subject.isbn).to eq isbn
            expect(subject.title).to eq title
            expect(subject.author).to eq author
        end
    end 

    context "has_title" do
        it "returns true if has_title('Harry Potter') is called" do
            result = subject.has_title('Harry Potter')
            expect(result).to eq true
        end

        it "returns false if has_title('Lord of the Rings') is called" do
            result = subject.has_title('Lord of the Rings')
            expect(result).to eq false
        end
    end
end
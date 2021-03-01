require 'book'

RSpec.describe Book do
    context "initialize" do
        let(:isbn) { 9780747532744 }
        let(:title) { 'Harry Potter' }
        let(:author) { 'J. K. Rowling' }

        subject { Book.new isbn, title, author }
        
        it "should be able to get isbn, title, author" do
            expect(subject.isbn).to eq isbn
            expect(subject.title).to eq title
            expect(subject.author).to eq author
        end
    end 
end
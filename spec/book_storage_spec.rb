require 'book_storage'
require 'book'

RSpec.describe 'BookStorage' do
    subject { BookStorage.new }

    context "initialize" do
        it "should have storage that is an empty hash" do
            storage = subject.storage
            expect(storage.is_a?(Hash)).to eq true
            expect(storage.empty?).to eq true
        end
    end 

    context "get_book_by_position" do
        let(:position) { "010101" }

        let(:isbn) { 9780747532744 }
        let(:title) { 'Harry Potter' }
        let(:author) { 'J. K. Rowling' }
        let(:book) { Book.new isbn, title, author }

        it "should return nil if get_book_by_position of empty storage is called" do
            result = subject.get_book_by_position(position)
            expect(result).to eq nil
        end

        it "should return book if get_book_by_position of not empty storage is called" do
            subject.storage[position] = book
            result = subject.get_book_by_position(position)
            expect(result.is_a?(Book)).to eq true
        end
    end

    context "add_book" do
        let(:isbn) { 9780747532744 }
        let(:title) { 'Harry Potter' }
        let(:author) { 'J. K. Rowling' }

        let(:book) { Book.new isbn, title, author }
        let(:position) { "010101" }

        it "should have one book inside storage if add_book to empty storage is called" do
            subject.add_book(position, book)
            expect(subject.storage.size()).to eq 1
        end

        it "should has book type for book that is added by add_book" do
            subject.add_book(position, book)
            result = subject.get_book_by_position(position)
            expect(result.is_a?(Book)).to eq true
        end
    end

    context "delete_book_from_position" do
        let(:isbn) { 9780747532744 }
        let(:title) { 'Harry Potter' }
        let(:author) { 'J. K. Rowling' }

        let(:book) { Book.new isbn, title, author }
        let(:position) { "010101" }

        it "should has empty storage if delete_book is called" do
            subject.add_book(position, book)
            result = subject.delete_book_from_position(position)
            expect(subject.storage.size()).to eq 0
        end

        it "should has one book if delete_book from two books storage is called" do
            subject.add_book(position, book)
            subject.add_book("010102", book)
            result = subject.delete_book_from_position(position)
            expect(subject.storage.size()).to eq 1
        end
    end

    context "to_s" do
        let(:book1) { Book.new 9780747532744, 'Harry Potter', 'J. K. Rowling' }
        let(:position1) { "010101" }
        let(:book2) { Book.new 9780747532745, 'Harry Potter 2', 'J. K. Rowling' }
        let(:position2) { "010102" }

        it "should return empty string if book storage has empty storage" do
            expect(subject.to_s).to eq ""
        end

        it "should return string of 1 book if book storage has 1 book" do
            subject.add_book(position1, book1)
            expect(subject.to_s).to eq "010101: 9780747532744 | Harry Potter | J. K. Rowling"
        end

        it "should return string of 2 books if book storage has 2 books" do
            subject.add_book(position1, book1)
            subject.add_book(position2, book2)
            expect(subject.to_s).to eq "010101: 9780747532744 | Harry Potter | J. K. Rowling\n010102: 9780747532745 | Harry Potter 2 | J. K. Rowling"
        end
    end

    context "find_book" do
        let(:isbn) { 9780747532744 }
        let(:title) { 'Harry Potter' }
        let(:author) { 'J. K. Rowling' }

        let(:book) { Book.new isbn, title, author }
        let(:position) { "010101" }

        before(:each) do
            subject.add_book(position, book)
            subject.add_book("010102", Book.new(9780747532745, 'Harry Potter 2', 'J. K. Rowling Jr.'))
        end

        it "should return Found the book at first position if find_book_by_isbn of first book is called" do
            result = subject.find_book_by_isbn(9780747532744)
            expect(result).to eq "Found the book at 010101"
        end

        it "should return Found the book at second position if find_book_by_isbn of second book is called" do
            result = subject.find_book_by_isbn(9780747532745)
            expect(result).to eq "Found the book at 010102"
        end

        it "should return Book not found! if find_book_by_isbn of non existence book is called" do
            result = subject.find_book_by_isbn(1111111111111)
            expect(result).to eq "Book not found!"
        end
    end

    context "search_book_by_author" do
        let(:isbn) { 9780747532744 }
        let(:title) { 'Harry Potter' }
        let(:author) { 'J. K. Rowling' }

        let(:book) { Book.new isbn, title, author }
        let(:position) { "010101" }

        before(:each) do
            subject.add_book(position, book)
            subject.add_book("010102", Book.new(9780747532745, 'Harry Potter 2', 'J. K. Rowling Jr., Eka Kurniawan'))
        end

        it "should return empty list if search book by author doesnt find anything" do
            result = subject.search_book_by_author("Uncle Bob")
            expect(result.size).to eq 0
        end

        it "should return list with size of 1 if search book by author can find 1 book" do
            result = subject.search_book_by_author("J. K. Rowling Jr")
            expect(result.size).to eq 1
        end

        it "should return list of books if books that have author input are more than 1" do
            result = subject.search_book_by_author("Rowling")
            expect(result.size).to eq 2
        end
    end
end
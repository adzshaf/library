require 'library'

RSpec.describe Library do
    subject { Library.new }

    context "build_library" do
        it "returns Shelf 1 with 1 row and 1 column is added if build_library(1, 1, 1)" do
            result = subject.build_library(1, 1, 1)
            expect(result).to eq "Shelf 1 with 1 row and 1 column is added"
        end

        it "returns Shelf 1 with 2 rows and 1 column is added if build_library(1, 2, 1)" do
            result = subject.build_library(1, 2, 1)
            expect(result).to eq "Shelf 1 with 2 rows and 1 column is added"
        end

        it "returns Shelf 1 with 1 row and 2 column is added if build_library(1, 1, 2)" do
            result = subject.build_library(1, 1, 2)
            expect(result).to eq "Shelf 1 with 1 row and 2 columns is added"
        end

        it "returns Shelf 1 with 1 row and 3 columns is added if build_library(1, 1, 3)" do
            result = subject.build_library(1, 1, 3)
            expect(result).to eq "Shelf 1 with 1 row and 3 columns is added"
        end

        it "returns Shelf 1 with 2 rows and 1 column is added if build_library(1, 2, 1)" do
            result = subject.build_library(1, 2, 1)
            expect(result).to eq "Shelf 1 with 2 rows and 1 column is added"
        end

        it "returns Shelf 1 with 2 rows and 2 columns is added if build_library(1, 2, 2)" do
            result = subject.build_library(1, 2, 2)
            expect(result).to eq "Shelf 1 with 2 rows and 2 columns is added"
        end

        it "returns Shelf 1 with 3 rows and 3 columns is added\nShelf 2 with 3 rows and 3 columns is added\nShelf 3 with 3 rows and 3 columns is added if build_library(2, 3, 3)" do
            result = subject.build_library(3, 3, 3)
            expect(result).to eq "Shelf 1 with 3 rows and 3 columns is added\nShelf 2 with 3 rows and 3 columns is added\nShelf 3 with 3 rows and 3 columns is added"
        end

        it "has 1 shelf, 2 row, 3 columns after build_library(1, 2, 3) is called" do
            subject.build_library(1, 2, 3)
            expect(subject.shelf_size).to eq 1
            expect(subject.row_size).to eq 2
            expect(subject.column_size).to eq 3
        end

        it "returns 010101 for available_position after build_library(1, 2, 3) is called" do
            subject.build_library(1, 2, 3)
            expect(subject.available_position).to eq "010101"
        end
    end

    context "put_book" do
        before(:each) do
            subject.build_library(2, 2, 2)
        end

        it "returns Allocated address: 010101" do
            result = subject.put_book(9780747532743, "Harry Potter 1", "J. K. Rowling")
            expect(result).to eq "Allocated address: 010101"
        end

        it "returns Allocated address: 010102 for second book" do
            subject.put_book(9780747532743, "Harry Potter 1", "J. K. Rowling")
            result = subject.put_book(9780747532744, "Harry Potter 2", "J. K. Rowling")
            expect(result).to eq "Allocated address: 010102"
        end

        it "has one book in storage after put book" do
            subject.put_book(9780747532743, "Harry Potter 1", "J. K. Rowling")
            expect(subject.book_storage.storage.size()).to eq 1
        end

        it "returns All shelves are full if no space left" do
            subject.available_position = nil
            result = subject.put_book(9780747532743, "Harry Potter 1", "J. K. Rowling")
            expect(result).to eq "All shelves are full!"
        end
    end

    context "increment_position" do
        before(:each) do
            subject.build_library(2, 2, 2)
        end

        it "set available_position to new column after increment_position is called" do
            subject.available_position = "010101"
            subject.increment_position
            expect(subject.available_position).to eq "010102"
        end

        it "set available_position to new row after put book in last column" do
            subject.available_position = "010102"
            subject.increment_position
            expect(subject.available_position).to eq "010201"
        end

        it "set available_position to new shelf after put book in last row" do
            subject.available_position = "010202"
            subject.increment_position
            expect(subject.available_position).to eq "020101"
        end

        it "set available_position to nil to show that there is no space left" do
            subject.available_position = "020202"
            subject.increment_position
            expect(subject.available_position).to eq nil
        end
    end

    context "list_books" do
        before(:each) do
            subject.build_library(1, 1, 2)
            subject.put_book(9780747532744, 'Harry Potter', 'J. K. Rowling')
            subject.put_book(9780747532745, 'Harry Potter 1', 'J. K. Rowling')
        end

        it "returns strings of books in book_storage by calling book_storage.to_s" do
            expect(subject.list_books).to eq subject.book_storage.to_s
        end
    end

    context "take_book_from" do
        before(:each) do
            subject.build_library(1, 1, 2)
            subject.put_book(9780747532744, 'Harry Potter', 'J. K. Rowling')
            subject.put_book(9780747532745, 'Harry Potter 1', 'J. K. Rowling')
        end

        it "should return Slot 010101 is free if take_book_from('010101') is called" do
            result = subject.take_book_from('010101')
            expect(result).to eq 'Slot 010101 is free'
        end

        it "should return Slot 010102 is free if take_book_from('010102') is called" do
            result = subject.take_book_from('010102')
            expect(result).to eq 'Slot 010102 is free'
        end

        it "should not have 010102 key of book_storage if take_book_from('010102') is called" do
            subject.take_book_from('010102')
            result = subject.book_storage.get_book_by_position('010102')
            expect(result).to eq nil
        end

        it "should return Invalid code! if parameter of position is outside of range is called" do
            result = subject.take_book_from('010103')
            expect(result).to eq "Invalid code!"
        end

        it "should return slot is empty if storage doesn't have keys" do
            subject.take_book_from('010102')
            result = subject.take_book_from('010102')
            expect(result).to eq "Slot 010102 is empty"
        end

        it "should call book_storage.delete_book_from_position" do
            book = Book.new(9780747532744, 'Harry Potter', 'J. K. Rowling')
            allow(subject.book_storage).to receive(:delete_book_from_position).and_return(Book)
            expect(subject.book_storage).to receive(:delete_book_from_position).with('010101')
            expect(subject.take_book_from('010101')).to eq ("Slot 010101 is free")
        end
    end

    context "find_book" do
        before(:each) do
            subject.build_library(1, 1, 2)
            subject.put_book(9780747532744, 'Harry Potter', 'J. K. Rowling')
            subject.put_book(9780747532745, 'Harry Potter 1', 'J. K. Rowling')
        end

        it "should return Found the book at 010101 if find_book('9780747532744') is called" do
            result = subject.find_book(9780747532744)
            expect(result).to eq 'Found the book at 010101'
        end

        it "should return Found the book at 010102 if find_book('9780747532745') is called" do
            result = subject.find_book(9780747532745)
            expect(result).to eq 'Found the book at 010102'
        end

        it "should return Book not found! if find_book of non existent book is called" do
            result = subject.find_book(9780747532746)
            expect(result).to eq 'Book not found!'
        end

        it "should call book_storage.find_book_by_isbn" do
            allow(subject.book_storage).to receive(:find_book_by_isbn).and_return(nil)
            expect(subject.book_storage).to receive(:find_book_by_isbn).with(9780747532746)
            expect(subject.find_book(9780747532746)).to eq ("Book not found!")
        end
    end

    context "search_book_by_author" do
        before(:each) do
            subject.build_library(1, 1, 2)
            subject.put_book(9780747532744, 'Harry Potter', 'J. K. Rowling')
            subject.put_book(9780747532745, 'Harry Potter 1', 'J. K. Rowling')
        end

        it "should call book_storage.search_book_by_author" do
            allow(subject.book_storage).to receive(:search_book_by_author).and_return([])
            expect(subject.book_storage).to receive(:search_book_by_author).with('Uncle Bob')
            expect(subject.search_book_by_author('Uncle Bob')).to eq ("No result found!")
        end

        it "should return no result found if no book is found from search_book_by_author" do
            result = subject.search_book_by_author('Uncle Bob')
            expect(result).to eq ("No result found!")
        end

        it "should return books if books are found from search_book_by_author" do
            result = subject.search_book_by_author('J. K. Rowling')
            expect(result).to eq ("9780747532744 | Harry Potter | J. K. Rowling\n9780747532745 | Harry Potter 1 | J. K. Rowling")
        end
    end

    context "search_book_by_title" do
        before(:each) do
            subject.build_library(1, 1, 2)
            subject.put_book(9780747532744, 'Harry Potter', 'J. K. Rowling')
            subject.put_book(9780747532745, 'Harry Potter 1', 'J. K. Rowling')
        end

        it "should return no result found if no book is found from search_book_by_title" do
            result = subject.search_book_by_title('Clean Code')
            expect(result).to eq ("No result found!")
        end

        it "should call book_storage.search_book_by_title" do
            allow(subject.book_storage).to receive(:search_book_by_title).and_return([])
            expect(subject.book_storage).to receive(:search_book_by_title).with('Clean Code')
            expect(subject.search_book_by_title('Clean Code')).to eq ("No result found!")
        end

        it "should return books if books are found from search_book_by_title" do
            result = subject.search_book_by_title('Harry Potter')
            expect(result).to eq ("9780747532744 | Harry Potter | J. K. Rowling\n9780747532745 | Harry Potter 1 | J. K. Rowling")
        end
    end
end
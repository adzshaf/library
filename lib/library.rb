require_relative 'book_storage'
require_relative 'book'

class Library
    attr_reader :shelf_size, :row_size, :column_size, :available_position, :book_storage
    attr_writer :available_position, :book_storage

    def initialize
        @book_storage = BookStorage.new 
    end

    def build_library(no_shelf, row, column)
        @shelf_size = no_shelf
        @row_size = row
        @column_size = column
        @available_position = "010101"

        output = []
        no_shelf.times do |index|
            if row > 1 and column >1
                output.push("Shelf #{index+1} with #{row} rows and #{column} columns is added")
            elsif row > 1 
                output.push("Shelf #{index+1} with #{row} rows and 1 column is added")
            elsif column > 1
                output.push("Shelf #{index+1} with 1 row and #{column} columns is added")
            else
                output.push("Shelf #{index+1} with 1 row and 1 column is added")
            end
        end
        output.join("\n")
    end

    def put_book(isbn, title, author)
        if @available_position.nil?
            return "All shelves are full!"
        end

        result = "Allocated address: #{@available_position}"

        book = Book.new(isbn, title, author)
        @book_storage.add_book(@available_position, book)

        increment_position

        result
    end

    def increment_position
        shelf = @available_position[0, 2].to_i
        row = @available_position[2, 2].to_i
        column = @available_position[4, 2].to_i

        if row + 1 > @row_size and column + 1 > @column_size
            column = 1
            row = 1
            shelf += 1
        elsif column + 1 > @column_size
            column = 1
            row += 1
        else
            column += 1
        end

        if shelf > @shelf_size
            @available_position = nil
        else
            @available_position = "%02d%02d%02d" % [shelf, row, column]
        end
    end

    def list_books
        @book_storage.to_s
    end

    def take_book_from(position)
        shelf = position[0, 2].to_i
        row = position[2, 2].to_i
        column = position[4, 2].to_i

        if shelf > @shelf_size or row > @row_size or column > column_size
            return "Invalid code!"
        end
        
        delete_result = @book_storage.delete_book_from_position(position)

        if delete_result.nil?
            return "Slot #{position} is empty"
        end
        "Slot #{position} is free"
    end

    def find_book(isbn)
        @book_storage.find_book_by_isbn(isbn)
    end

    def search_book_by_author(author)
        result = @book_storage.search_book_by_author(author)
        if result.empty? 
            "No result found!"
        else
            string_result = []
            result.each do |book|
                string_result.push(book.to_s)
            end
            string_result.join("\n")
        end
    end

    def search_book_by_title(title)
        result = @book_storage.search_book_by_title(title)
        if result.empty? 
            "No result found!"
        else
            string_result = []
            result.each do |book|
                string_result.push(book.to_s)
            end
            string_result.join("\n")
        end
    end
end
require_relative 'book_storage'
require_relative 'book'

class Library
    attr_reader :shelf_size, :row_size, :column_size, :available_position, :book_storage
    attr_writer :available_position, :book_storage

    def initialize
        @book_storage = BookStorage.new 
    end

    def build_library(no_shelf, row, column)
        @shelf_size = no_shelf.to_i
        @row_size = row.to_i
        @column_size = column.to_i
        @available_position = "010101"

        output = []
        @shelf_size.times do |index|
            if @row_size > 1 and @column_size > 1
                output.push("Shelf #{index+1} with #{row} rows and #{column} columns is added")
            elsif @row_size > 1 
                output.push("Shelf #{index+1} with #{row} rows and 1 column is added")
            elsif @column_size > 1
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

        find_available_position

        result
    end

    def find_available_position
        until @book_storage.get_book_by_position(@available_position).nil?
            increment_position
        end
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
        if position_valid?(position)
            delete_result = @book_storage.delete_book_from_position(position)
        else
            return "Invalid code!"
        end

        if delete_result.nil?
            "Slot #{position} is empty"
        else
            @available_position = position
            "Slot #{position} is free"
        end
    end

    def find_book(isbn)
        position = @book_storage.find_book_by_isbn(isbn)
        if position.nil?
            "Book not found!"
        else
            "Found the book at #{position}"
        end
    end

    def search_book_by_author(author)
        result = @book_storage.search_book_by_author(author)
        send_outputs(result)
    end

    def search_book_by_title(title)
        result = @book_storage.search_book_by_title(title)
        send_outputs(result)
    end

    private
    def send_outputs(result)
        if result.empty? 
            "No result found!"
        else
            result.join("\n")
        end
    end

    private
    def position_valid?(position)
        shelf = position[0, 2].to_i
        row = position[2, 2].to_i
        column = position[4, 2].to_i

        if shelf > @shelf_size or row > @row_size or column > column_size
            return false
        end
        true
    end
end
require_relative 'book_storage'

class Library
    def initialize
        @book_storage = BookStorage.new 
    end

    def build_library(no_shelf, row, column)
        if row > 1 
            "Shelf 1 with #{row} rows and 1 column is added"
        elsif column > 1
            "Shelf 1 with 1 row and #{column} columns is added"
        else
            "Shelf 1 with 1 row and 1 column is added"
        end
    end
end
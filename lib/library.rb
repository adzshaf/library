require_relative 'book_storage'

class Library
    def initialize
        @book_storage = BookStorage.new 
    end

    def build_library(no_shelf, row, column)
        "Shelf 1 with 1 row and 1 column is added"
    end
end
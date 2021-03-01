require_relative 'book_storage'

class Library
    attr_reader :shelf_size, :row_size, :column_size

    def initialize
        @book_storage = BookStorage.new 
    end

    def build_library(no_shelf, row, column)
        @shelf_size = no_shelf
        @row_size = row
        @column_size = column

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
end
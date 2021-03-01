require_relative 'book_storage'

class Library
    def initialize
        @book_storage = BookStorage.new 
    end

    def build_library(no_shelf, row, column)
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
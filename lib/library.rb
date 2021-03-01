require_relative 'book_storage'

class Library
    attr_reader :shelf_size, :row_size, :column_size, :available_position
    attr_writer :available_position

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
        result = "Allocated address: #{@available_position}"

        increment_position

        result
    end

    def increment_position
        shelf = @available_position[0, 2].to_i
        row = @available_position[2, 2].to_i
        column = @available_position[4, 2].to_i

        if column + 1 > @column_size
            column = 1
            row += 1
        else
            column += 1
        end

        @available_position = "%02d%02d%02d" % [shelf, row, column]
    end
end
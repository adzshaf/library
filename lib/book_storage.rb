class BookStorage
    attr_reader :storage

    def initialize
        @storage = Hash.new
    end

    def get_book_by_position(position)
        @storage[position]
    end

    def add_book(position, book)
        @storage[position] = book
    end

    def delete_book_from_position(position)
        @storage.delete(position)
    end

    def to_s
        if @storage.size > 0 
            result = []

            @storage.each do |key, book|
                result.push("#{key}: #{book.to_s}")
            end
            result.join("\n")
        else
            ""
        end
    end

    def find_book_by_isbn(isbn)
        position_result = ""

        @storage.each do |position, book|
            if book.has_isbn?(isbn)
                position_result = position
            end
        end
        
        "Found the book at #{position_result}"
    end
end
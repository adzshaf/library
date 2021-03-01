class BookStorage
    attr_reader :storage

    def initialize
        @storage = Hash.new
    end

    def get_book_by_position(position)
        @storage[position]
    end
end
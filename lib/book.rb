class Book
    attr_reader :isbn, :title, :author
    
    def initialize(isbn, title, author)
        @isbn = isbn
        @title = title
        @author = author
    end
end
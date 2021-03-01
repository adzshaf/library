class Book
    attr_reader :isbn, :title, :author

    def initialize(isbn, title, author)
        @isbn = isbn
        @title = title
        @author = author
    end

    def has_title?(title)
        @title.downcase.include? title.downcase
    end

    def has_author(author)
        if @author.include? author
            true
        else
            false
        end
    end
end
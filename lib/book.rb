class Book
    attr_reader :isbn, :title, :author

    def initialize(isbn, title, author)
        @isbn = isbn
        @title = title
        @author = author
    end

    def has_title(title)
        if @title.downcase.include? title.downcase
            true
        else
            false
        end
    end

    def has_author(author)
        if author.eql? "J. K. Rowling"
            true
        else
            false
        end
    end
end
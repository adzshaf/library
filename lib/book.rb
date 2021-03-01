class Book
    attr_reader :isbn, :title, :author

    def initialize(isbn, title, author)
        @isbn = isbn
        @title = title
        @author = author
    end

    def has_title(title)
        if @title.include? title
            true
        else
            false
        end
    end
end
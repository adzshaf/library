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

    def has_author?(author)
        @author.downcase.include? author.downcase
    end

    def to_s
        "#{@isbn} | #{@title} | #{@author}"
    end

    def has_isbn?(isbn_input)
        true
    end
end
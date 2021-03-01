class BookStorage
    attr_reader :storage

    def initialize
        @storage = Hash.new
    end
end
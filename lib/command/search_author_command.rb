require_relative 'command'
require_relative '../library.rb'

class SearchAuthorCommand < Command
    def execute(args)
        author = args[0]
        
        Library.instance.search_book_by_author(author)
    end   
end
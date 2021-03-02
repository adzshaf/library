require_relative 'command'
require_relative '../library.rb'

class SearchTitleCommand < Command
    def execute(args)
        title = args[0]
        
        Library.instance.search_book_by_title(title)
    end   
end
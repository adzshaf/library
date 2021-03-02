require_relative 'command'
require_relative '../library.rb'

class ListBooksCommand < Command
    def execute(args)  
        Library.instance.list_books
    end   
end
require_relative 'command'
require_relative '../library.rb'

class TakeBookCommand < Command
    def execute(args)        
        position = args[0]
        
        Library.instance.take_book_from(position)
    end   
end
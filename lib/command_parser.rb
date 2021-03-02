require "./lib/command/find_book_command"
require "./lib/command/build_library_command"
require "./lib/command/put_book_command"
require "./lib/command/take_book_command"
require "./lib/command/search_title_command"
require "./lib/command/search_author_command"
require "./lib/command/list_books_command"

class CommandParser
    @@instance = CommandParser.new

    def self.instance
        @@instance
    end

    def initialize
        @commands = Hash.new
        @commands["find_book"] = FindBookCommand.new
        @commands["build_library"] = BuildLibraryCommand.new
        @commands["put_book"] = PutBookCommand.new
        @commands["take_book_from"] = TakeBookCommand.new
        @commands["search_books_by_title"] = SearchTitleCommand.new
        @commands["search_books_by_author"] = SearchAuthorCommand.new
        @commands["list_books"] = ListBooksCommand.new
    end

    def execute(command, args)
        command = @commands[command]
        command.execute(args)
    end
end
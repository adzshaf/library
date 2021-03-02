require "./lib/command/find_book_command"

class CommandParser
    @@instance = CommandParser.new

    def self.instance
        @@instance
    end

    def initialize
        @commands = Hash.new
        @commands["find_book"] = FindBookCommand.new
    end

    def execute(command, args)
        command = @commands[command]
        command.execute(args)
    end
end
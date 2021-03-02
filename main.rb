require './lib/command_parser'

command_parser = CommandParser.new

while true do
    line = gets
    command_line = line.delete_suffix("\n").split("|")

    puts command_parser.execute(command_line[0], command_line[1..])
end
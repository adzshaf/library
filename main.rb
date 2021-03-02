require './lib/library'

library = Library.new

while true do
    line = gets
    command_line = line.delete_suffix("\n").split("|")
    p command_line

    if command_line[0] == "build_library"
        puts library.build_library(command_line[1], command_line[2], command_line[3])
    elsif command_line[0] == "put_book"
        puts library.put_book(command_line[1], command_line[2], command_line[3])
    elsif command_line[0] == "take_book_from"
        puts library.take_book_from(command_line[1])
    elsif command_line[0] == "find_book"
        puts library.find_book(command_line[1])
    elsif command_line[0] == "list_books"
        puts library.list_books
    elsif command_line[0] == "search_books_by_title"
        puts library.search_book_by_title(command_line[1])
    elsif command_line[0] == "search_books_by_author"
        puts library.search_book_by_author(command_line[1])
    elsif command_line[0] == "exit"
        break
    else
        puts "Wrong command!"
    end
end
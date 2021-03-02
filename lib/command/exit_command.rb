require_relative 'command'

class ExitCommand < Command
    def execute(args)  
        exit
    end   
end
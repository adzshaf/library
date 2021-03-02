class Command 
    def execute(args)
        raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end   
end
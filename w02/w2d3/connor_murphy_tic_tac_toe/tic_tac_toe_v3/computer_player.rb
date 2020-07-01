class ComputerPlayer

    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position(legal_positions)
        puts "The Computer Player #{self.mark.to_s} picks:"
        return legal_positions.sample
        
    end


end
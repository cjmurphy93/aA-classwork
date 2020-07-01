class HumanPlayer
attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position
        puts "Please enter a position 'row col'"
        input = gets.chomp.split
        if input.length == 2 && input.all? {|ele| ele == ele.to_i.to_s}
            return input.map(&:to_i)
        else
            raise
        end
    end

    

end
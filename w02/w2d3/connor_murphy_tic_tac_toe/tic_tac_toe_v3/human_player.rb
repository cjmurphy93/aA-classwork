class HumanPlayer
attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position(legal_positions)
        puts "Please enter a position 'row col'"
        input = gets.chomp.split
        while !((input.length == 2 && input.all? {|ele| ele == ele.to_i.to_s}) && legal_positions.include?(input.map(&:to_i)))
            while !(input.length == 2 && input.all? {|ele| ele == ele.to_i.to_s})
                puts "Incorrect entry, Please use 'row col' with numbers"
                input = gets.chomp.split
            end
            while !legal_positions.include?(input.map(&:to_i))
                puts 'That is not an available position, please endter again'
                input = gets.chomp.split
            end
        end
        return input.map(&:to_i)
        
    end

    

end
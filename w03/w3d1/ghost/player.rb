#thin layer of human interaction for game
class Player 
    attr_reader :name
    def initialize(name)
        @name = name
    end

    def guess 
        puts "Please make a guess"
        gets.chomp
    end

    def alert_invalid_guess(input)
        if input.length > 1 || !("a".."z").to_a.include?(input)
            puts "Not a valid guess. Please try again"
            return false
        end
        true
    end

end
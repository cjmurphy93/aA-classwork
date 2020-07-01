require_relative 'board'
require_relative 'card'

class Game
    def initialize(size=4)
        @board = Board.new(size)

        @prev_guess = nil
    end


    def make_guess
        puts "make guess"
        pos1 = gets.chomp.to_i
        make_guess if !@board.reveal(pos1)
        return pos1 
    end

    def turn
        puts 'First:'
        @prev_guess = self.make_guess
        @board.render
        puts 'Second:'
        current = self.make_guess
        if @board[@prev_guess] == @board[current]
            puts "Correct!"
        else
            puts "Incorrect"
            @board[@prev_guess].hide
            @board[current].hide
        end
        @prev_guess = nil
    end

    def play
        until @board.won?
            #system("clear")
            @board.render
            self.turn
        end
    end

end
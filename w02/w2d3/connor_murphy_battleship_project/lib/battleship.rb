require_relative "board"
require_relative "player"

class Battleship
    attr_reader :board, :player
    def initialize(num)
        @player = Player.new
        @board = Board.new(num)
        @remaining_misses = @board.size / 2
    end

def start_game
    @board.place_random_ships
    puts @board.num_ships
    @board.print
end

def lose?
    if @remaining_misses <= 0
        puts "you lose"
        true
    else
        false
    end
end

def win?
    if @board.num_ships == 0
        puts "you win"
        return true
    else
        false
    end
end

def game_over?
    win? || lose? 
end
def turn
    move = @player.get_move 
    @remaining_misses -= 1 if !@board.attack(move) 
    @board.print 
    puts @remaining_misses
end
end

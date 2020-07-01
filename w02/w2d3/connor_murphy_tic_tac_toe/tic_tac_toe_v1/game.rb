require_relative 'board'
require_relative 'human_player'

class Game

def initialize(player_1_mark, player_2_mark)
    @player_1 = HumanPlayer.new(player_1_mark)
    @player_2 = HumanPlayer.new(player_2_mark)
    @current_player = @player_1 
    @board = Board.new
end

def switch_turn
    if @current_player == @player_1
        @current_player = @player_2
    else
        @current_player = @player_1
    end
end

def play
    while @board.empty_positions?
        @board.print
        puts 'Player ' + @current_player.mark.to_s + ':'
        input = @current_player.get_position
        @board.place_mark(input, @current_player.mark)
        if @board.win?(@current_player.mark)
            puts @current_player.mark.to_s + ' WINS!'
            return
        else
            self.switch_turn
        end
    end
    puts 'DRAW!!!'
end

end
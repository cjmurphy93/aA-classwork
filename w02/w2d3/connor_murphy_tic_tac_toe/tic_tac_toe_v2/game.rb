require_relative 'board'
require_relative 'human_player'

class Game

def initialize(size, *marks)
    @players = marks.map {|mark| HumanPlayer.new(mark)}
    @current_player = @players[0]
    @board = Board.new(size)
end

def switch_turn
    @current_player = @players.rotate![0]
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
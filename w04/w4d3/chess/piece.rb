require_relative 'board'
class Piece
    attr_reader :color, :board, :pos
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def valid_moves
    
    end

    def to_s
        "#{symbol}"
    end
end


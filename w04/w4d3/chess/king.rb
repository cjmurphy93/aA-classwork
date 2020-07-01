require_relative 'stepable'
require_relative 'piece'
class King < Piece
    include Stepable

    def symbol
        "♚".to_sym
    end

    def move_diffs
    [[0, 1], [1, 1], [1, 0], [1, -1], [0, -1], [-1,-1], [-1, 1], [-1, 0]]
    end
end
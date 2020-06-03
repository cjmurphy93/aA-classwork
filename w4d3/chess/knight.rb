
require_relative 'stepable'
require_relative 'piece'
class Knight < Piece
    include Stepable

    def symbol
        "♞".to_sym
    end

    def move_diffs
        [-2, -1],
        [-2,  1],
        [-1, -2],
        [-1,  2],
        [ 1, -2],
        [ 1,  2],
        [ 2, -1],
        [ 2,  1]
    end
end

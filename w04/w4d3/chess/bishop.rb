require_relative 'slideable'
require_relative 'piece'
class Bishop < Piece
    include Slideable

    def symbol
        "♝".to_sym
    end

    def move_dirs
        diagonal_dirs
    end
end
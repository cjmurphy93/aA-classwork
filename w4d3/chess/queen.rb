require_relative 'slideable'
require_relative 'piece'
class Queen < Piece
    include Slideable

    def symbol
        "♛".to_sym
    end

    def move_dirs
        horizontal_dirs
        diagonal_dirs
    end
end
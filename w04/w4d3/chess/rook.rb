require_relative 'slideable'
require_relative 'piece'
class Rook < Piece
    include Slideable

    def symbol
        "♜".to_sym
    end

    def move_dirs
        horizontal_dirs
    end
end
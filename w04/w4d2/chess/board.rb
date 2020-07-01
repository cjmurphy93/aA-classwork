require 'byebug'

class Board
    # attr_reader :rows
    def initialize
        @rows= Array.new(8) {Array.new(8, nil)}
        # @sentinel = NullPiece 
    end

    def [](pos)
        x, y = pos
        @rows[x][y]
    end

    def []=(pos, val)
        x, y = pos
        @rows[x][y] = val
    end

    def move_piece(start_pos, end_pos)
        x,y = end_pos
        raise "that's off the board" if !(0..7).to_a.include?(x) || !(0..7).to_a.include?(y)
        raise 'there is no piece here' if self[start_pos] == nil
        raise "you can't move there" if self[end_pos] != nil

        self[end_pos] = self[start_pos]
        self[start_pos] = nil
    end

end
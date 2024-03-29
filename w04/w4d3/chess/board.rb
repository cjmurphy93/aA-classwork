require 'byebug'
require_relative 'null_piece'

class Board
     attr_reader :rows
    def initialize
        @sentinel = NullPiece.instance 
        @rows= Array.new(8) {Array.new(8, @sentinel)}
        
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
        raise "that's off the board" if !valid_pos(end_pos)
        raise 'there is no piece here' if self[start_pos] == nil
        raise "you can't move there" if self[end_pos] != nil

        self[end_pos] = self[start_pos]
        self[start_pos] = @sentinel
    end

    def valid_pos(pos)
        x, y = pos
        (0..7).to_a.include?(x) && (0..7).to_a.include?(y)
    end

    

    
end
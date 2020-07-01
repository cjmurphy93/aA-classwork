

module Stepable

    def moves
         all_moves = []
        self.move_diffs.each do |diffs|
            dx, dy = diffs
            x,y = self.pos
            new_position = [x + dx, y + dy]
            all_moves << new_position if self.color != self.board[new_position].color && new_position.all? {|ele| ele.between?(0,7)}
        end
        all_moves
    end

    def move_diffs
    end

end
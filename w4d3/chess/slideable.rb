module Slideable
    
    HORIZONTAL_DIRS = [[0, 1], [0, -1], [1, 0], [-1, 0]]
    DIAGONAL_DIRS = [[1,1], [-1,-1], [1,-1], [-1,1]]
    
    def moves
        all_moves = []
        self.move_dir.each do |dir|
            x,y = dir
            all_moves << grow_unblocked_moves_in_dir(x, y)
        end
        all_moves
    end
    
    def horizontal_dirs
        HORIZONTAL_DIRS
    end
    
    def diagonal_dirs
        DIAGONAL_DIRS
    end
    
    def move_dirs
    end
    
    def grow_unblocked_moves_in_dir(dx, dy)
        start_pos = self.pos
        possible_moves = []
        
        until !self.board[start_pos].is_a?(NullPiece)
            start_pos[0] += dx
            start_pos[1] += dy 
            possible_moves << start_pos
        end
        possible_moves.pop if self.board[possible_moves[-1]].color == self.color
        possible_moves#still needs to be cleaned up.. a lot

            
    end

end


#pos 0,0 #(1..6) 
    #break if same color or break if end of board

#vert, hori

#diagonal


#pick a direction
#go in that direction until stopped
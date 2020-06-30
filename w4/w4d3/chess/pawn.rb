require_relative 'piece'

class Pawn < Piece
 
    def symbol
        "♟︎".to_sym
    end
    
    def move_dirs
        self.forward_steps + self.side_attacks

    end

    def at_start_row?
        self.pos[0] == 6 || self.pos[0] == 1
    end

    def forward_dir
        self.color == black ? -1 : 1
    end

    def forward_steps
        steps = []
        if self.at_start_row?
            steps << [0, 2 * self.forward_dir] #have to check for end_pos validity
        else 
            steps << [0, 1 * self.forward_dir]
        end
        steps
    end

    def side_attacks
        attacks = []

        attacks << [1, 1 * self.forward_dir]
        attacks << [-1, 1 * self.forward_dir]

        attacks.reject do |delta|
            dx, dy = delta
            new_pos = [self.pos[0] + dx, self.pos[1] + dy]
            self.board[new_pos] == self.color or self.board[new_pos].is_a?(NullPiece)
        end
        attacks
        

    end

    ####[0,1] white [0,-1] black  [0,2],[0,-2]
#[1,-1],[1, 1]        [-1,-1],[-1, 1]

end

#how to implment movement within subclasses and with the modules
#clarification on singleton and nullpiece- 1 null piece is referenced many times
#github is it all one repositary, how to download a days folder without taking the entire repository
#further clarification of super
#how much should we follow the UML guidelines when we are trying to creating a working product vs a finished product
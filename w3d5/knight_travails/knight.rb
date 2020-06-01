require_relative "../polytree/skeleton/lib/00_tree_node"

class KnightPathFinder

    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [pos]
    end

    def self.valid_moves(pos)
        x, y = pos
        moves = []
        moves << [x + 2, y + 1] if x + 2 < 8 && y + 1 < 8
        moves << [x + 2, y - 1] if x + 2 < 8 && y - 1 >= 0
        moves << [x + 1, y - 2] if x + 1 < 8 && y - 2 >= 0
        moves << [x - 1, y - 2] if x - 1 >= 0 && y - 2 >= 0
        moves << [x - 2, y - 1] if x - 2 >= 0 && y - 1 >= 0
        moves << [x - 2, y + 1] if x - 2 >= 0 && y + 1 < 8
        moves << [x + 1, y + 2] if x + 1 < 8 && y + 2 < 8
        moves << [x - 1, y + 2] if x - 1 >= 0 && y + 2 < 8
        moves
    end

    def new_move_positions(pos)
        new_positions = KnightPathFinder.valid_moves(pos)
        new_positions.reject! {|move| @considered_positions.include?(move)}
        @considered_positions += new_positions
        return new_positions
    end

    def build_move_tree(pos)
        # tree is an array of nodes [root node]
        # factory queue [pos]
        # loop:
        #   instantiate parent node queue.first
        #   pos queue.first => new move positions => filtered array
        #   iterate that filtered array
        #     also push pos into considered positions
        #     also push pos into end of queue
        #   back to top of loop until queue empty
        tree = []
        queue = [pos]
        until queue.empty?
            po
        end
    end

end

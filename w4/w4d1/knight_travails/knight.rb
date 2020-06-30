require_relative "../polytree/skeleton/lib/00_tree_node"

class KnightPathFinder

    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [pos]
        self.build_move_tree
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

    def build_move_tree
        queue = [@root_node]
        until queue.empty?
            parent_node = queue.shift
            self.new_move_positions(parent_node.value).each do |position|
                parent_node.add_child(PolyTreeNode.new(position))
            end
            queue += parent_node.children 
        end
    end

    def find_path(end_pos)
        end_node = @root_node.dfs(end_pos)
        self.trace_path_back(end_node)
    end

    def trace_path_back(end_node)
        return [end_node.value] if end_node.parent.nil?
        trace_path_back(end_node.parent) + [end_node.value]
    end

end

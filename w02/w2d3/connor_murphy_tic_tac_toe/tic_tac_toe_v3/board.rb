class Board
    def initialize(n)
        @grid = Array.new(n) {Array.new(n, '_')}
    end

    def valid?(pos)
        row, col = pos
        (row < @grid.length && col < @grid.length) && (row >= 0 && col >= 0)
    end

    def empty?(pos)
        row, col = pos
        @grid[row][col] == '_'
    end

    def place_mark(pos, mark)
        row, col = pos
        if self.valid?(pos) && self.empty?(pos)
            
            @grid[row][col] = mark
        else
            raise
        end
    end

    def print
        @grid.each do |sub|
            puts sub.join("|")
        end
    end

    def win_row?(mark)
        @grid.any? {|row| row.all? {|ele| ele == mark}}
    end

    def win_col?(mark)
        (0...@grid.length).to_a.any? {|col| (0...@grid.length).to_a.all? {|row| @grid[row][col] == mark}}
    end

    def win_diagonal?(mark)
        left_d = (0...@grid.length).to_a.all? {|num| @grid[num][num] == mark}
        right_d = []
        i = -1
        j = 0
        while i >= (@grid.length * -1)
            right_d << @grid[i][j]
            i -= 1
            j += 1
        end
        left_d || (right_d.all? {|ele| ele == mark})
    end

    def win?(mark)
        (win_col?(mark) || win_row?(mark)) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.flatten.any?('_')
    end

    def legal_positions
        n = @grid.length
        positions = []
        (0...n).each do |i|
            (0...n).each do |j|
                if @grid[i][j] == '_'
                    positions << [i, j]
                end
            end
        end
        positions
    end

end

# [1] pry(main)> load 'board.rb'
# => true

# [2] pry(main)> b = Board.new
# => #<Board:0x @grid=[["_", "_", "_"], ["_", "_", "_"], ["_", "_", "_"]]>

# [3] pry(main)> b.place_mark([-1, 2], :X) # this should fail
# RuntimeError: invalid mark
# from board.rb:28:in `place_mark'

# [4] pry(main)> b.place_mark([1, 2], :X)
# => :X

# [5] pry(main)> b
# => #<Board:0x @grid=[["_", "_", "_"], ["_", "_", :X], ["_", "_", "_"]]>

# [6] pry(main)> b.place_mark([1, 3], :X) # this should fail
# RuntimeError: invalid mark
# from board.rb:28:in `place_mark'

# [7] pry(main)> b.place_mark([0, 0], :O)
# => :O

# [8] pry(main)> b
# => #<Board:0x @grid=[[:O, "_", "_"], ["_", "_", :X], ["_", "_", "_"]]>

# [9] pry(main)> b.place_mark([0, 0], :X) # this should fail
# RuntimeError: invalid mark
# from board.rb:28:in `place_mark'

# [1] pry(main)> load 'board.rb'
# => true
# [2] pry(main)> b = Board.new
# => #<Board:0x00007f9fd286c378 @grid=[["_", "_", "_"], ["_", "_", "_"], ["_", "_", "_"]]>
# [3] pry(main)> b.place_mark([0, 0], :X)
# => :X
# [4] pry(main)> b.place_mark([1, 1], :X)
# => :X
# [5] pry(main)> b.place_mark([2, 2], :X)
# => :X
require 'byebug'

class Board
    attr_reader :size
  def initialize (num)
    @grid = Array.new(num) { Array.new(num, :N) } #: something that xcant be changed 
    @size = num * num
  end

  def [](arr) #@grid.[](0, 1) == grid[0, 1]
    @grid[arr[0]][arr[1]]
  end

    def []=(arr, val)
    # @grid[pos] = val
    row, col = arr
    @grid[row][col] = val
    end

    def num_ships
        @grid.flatten.count {|ele| ele == :S}
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            puts 'you sunk my battleship!'
            return true
        else
            self[pos] = :X
            return false
        end
    end

    def place_random_ships
    random = 0.25 * self.size 

        while self.num_ships < random 
            rows = rand(0 ...@grid.length)
            cols = rand(0 ... @grid.length)
            pos = [rows, cols]
            self[pos] = :S
        end
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map do |ele|
                if ele == :S
                    ele = :N 
                else 
                    ele 
                end 
            end
        end
    end

    def self.print_grid(grid)
        grid.each do | row | #row is an arr 
            puts row.join(' ') #arr.join(' ')
            # puts enter a new line, p doesnt 
            # puts always returns nil after printing 
            # p returns the result 
        end 
    end 

    def cheat 
        Board.print_grid(@grid)
    end 

    def print 
        Board.print_grid(self.hidden_ships_grid) 
    end 
end

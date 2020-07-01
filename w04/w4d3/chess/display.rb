require 'colorize'
require_relative 'board'
require_relative 'cursor'

class Display

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], @board)
    end

    def render
        until @cursor.get_input

            builder.each do |row|
                puts row.join("|")
            end
           
            puts "Please enter a key:"

        end

        

    end

    def builder
        @board.rows.map.with_index do |row, j|
            row.map.with_index do |piece, i|
                if @cursor.cursor_pos == [i, j]
                piece.to_s.colorize(background: :green)
                
                elsif j.odd?
                    i.odd? ? piece.to_s.colorize(background: :blue) : piece.to_s.colorize(background: :red)
                else
                    i.even? ? piece.to_s.colorize(background: :blue) : piece.to_s.colorize(background: :red)
                end
                
            end
        end
    end

    # def cursor_color(i, j)
    #   if cursor.cursor_pos == [i,j] 
    #     piece.to_s.colorize(background: :orange)
    #   end
    # end

end

#given a pos, every other squae is a different background color.

# piece.to_s.colorize(background: :blue)


# a = Board.new
# d = Display.new(a)
# d.render
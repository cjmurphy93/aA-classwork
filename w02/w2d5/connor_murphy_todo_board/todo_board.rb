require 'byebug'
require_relative 'item'
require_relative 'list'

class TodoBoard

    def initialize
        @board = {}
    end

    def get_command
        puts "Please enter mktodo, up, down, toggle, purge, rm, swap, sort, priority, print, or quit:"
        cmd, *args = gets.chomp.split(" ")

        case cmd
        when 'mklist'
            @board[*args] = List.new(*args)
            true
        when 'ls'
            puts @board.keys
            true
        when 'showall'
           @board.values.each { |list| list.print }
            true
        when 'mktodo'
            #debugger
            @board[args[0]].add_item(*args[1..-1])
            true
        when 'up'
            @board[args[0]].up(*args[1..-1])
            true
        when 'down'
            @board[args[0]].down(*args[1..-1])
            true
        when 'swap'
            @board[args[0]].swap(*args[1..-1])
            true
        when 'sort'
            @board[args[0]].sort_by_date!
            true
        when 'priority'
            @board[args[0]].print_priority
            true
        when 'print'
            if args.length == 1
                @board[args[0]].print 
            else
                @board[args[0]].print_full_item(*args[1..-1]) 
            end
            true
        when 'toggle'
            @board[args[0]].toggle_item(*args[1..-1])
            true
        when 'rm'
            @board[args[0]].remove_item(*args[1..-1])
            true
        when 'purge'
            @board[args[0]].purge
            true
        when 'quit'
            return false
        else
            true
        end
    end

    def run
        while self.get_command
        end
    end

end

# my_TodoBoard = TodoBoard.new
# my_TodoBoard.run

# mklist groceries
# mktodo groceries shampoo 1990-03-25
# mktodo groceries candy 2019-09-31 yummy
# mktodo groceries cheese 2005-05-09 cheddar
# mktodo groceries toothbrush 1001-02-21
require_relative 'tic_tac_toe_node'
require "byebug"


class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    new_node = TicTacToeNode.new(game.board.dup, mark)
    kids = new_node.children
    # debugger
    kids.each do |kid|
      
      return kid.prev_move_pos if kid.winning_node?(mark) 

    end
    # debugger
    kids.each do |kid|
     
      return kid.prev_move_pos if !kid.losing_node?(mark)
      
    end
    raise "NO NODES IS GOOD NODES?"
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end



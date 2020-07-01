require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_accessor :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    return true if @board.won? && @board.winner != evaluator
    return false if @board.won? && @board.winner == evaluator
    return false if @board.tied?
    self.children.any? {|child| child.losing_node?(evaluator)}
  end

  def winning_node?(evaluator)
    return true if @board.won? && @board.winner == evaluator
    return false if @board.won? && @board.winner != evaluator
    return false if @board.tied?
    self.children.any? {|child| child.winning_node?(evaluator)}    
  end

  def switch_mark
    # switch mark from :x to :o or vice versa
    if @next_mover_mark == :x
      :o
    else
      :x
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    kids = []
    (0..2).each do |y|
      (0..2).each do |x|
        if @board.empty?([x,y])
          kids << [x,y]
         
        end
      end
    end
    
    #We need to put th mark on the board
    #we need to have prev_pos
    #make a new board
    new_arr = [] 
    kids.each do |kid|
      new_board = @board.dup
      new_board[kid] = @next_mover_mark
      other_mark = self.switch_mark
      new_arr << TicTacToeNode.new(new_board, other_mark, kid)
      
    end
     new_arr
  end
end

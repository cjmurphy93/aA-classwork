require 'singleton'
require_relative 'piece'
class NullPiece < Piece
    include Singleton
    attr_reader :symbol, :color
    def initialize
        @symbol = "_".to_sym
        @color = nil
    end
end

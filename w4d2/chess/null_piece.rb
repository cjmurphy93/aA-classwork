require 'singleton'

class NullPiece < Piece
    include Singleton
    attr_reader :symbol, :color
    def initialize
        @symbol = "_"
        @color = nil
    end
end

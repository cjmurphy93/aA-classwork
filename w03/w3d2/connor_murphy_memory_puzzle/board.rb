require_relative 'card'

class Board
    attr_reader :cards
    def initialize(size)
        @cards = []
        self.populate(size)
        #@grid = Array.new(size) {Array.new(size)}
    end
    
    def populate(size)
        possibles = ('a'..'z').to_a.sample(size)
        full = possibles + possibles
        full.sample(full.length).each do |val|
            @cards << Card.new(val)
        end
    end

    def [](pos)
        @cards[pos]
    end

    def render
        @cards.each_with_index do |card, i|
            p "#{i}:"
            p card.value

        end
    end

    def won?
        @cards.each {|card| return false if card.face_up == false}
        true
    end

    def reveal(guessed_pos)
        if @cards[guessed_pos].face_up 
            puts "Card already face up"
            return false
        else
            @cards[guessed_pos].reveal
            puts @cards[guessed_pos].value
            return true
        end
    end


end
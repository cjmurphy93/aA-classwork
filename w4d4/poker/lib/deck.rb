class Deck
    VALUES = [:spades, :hearts, :diamonds, :clubs]
    NUMBERS= [:A,2,3,4,5,6,7,8,9,10,:J,:Q,:K]
    attr_reader :cards
    def initialize
        @cards = []
        fill_deck
        self.shuffle_cards
    end

    def fill_deck
        VALUES.each do |value|
            NUMBERS.each do |number|
                @cards << Card.new(number, value)
            end
        end
    end

    def shuffle_cards
        @cards.shuffle!
    end

end
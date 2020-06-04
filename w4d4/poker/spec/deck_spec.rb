require 'deck'

describe Deck do
    subject(:deck) {Deck.new}
    describe "#initialize" do 
        it "should set the deck to 52 cards" do
            expect(deck.cards.length).to eq(52)
        end
        it "should set all unique cards" do 
            expect(deck.cards.any? {|card1| deck.cards.any? {|card2| card1.number == card2.number && (card1.value == card2.value && card1.object_id != card2.object_id) }}).to eq(false)
        end
        # it "should call #shuffle_cards" do
        #     expect(deck).to receive(:shuffle_cards)
        #     deck = Deck.new
        # end
    end

describe "#shuffle_cards" do
    it "should shuffle cards" do
        dummy = deck.cards.dup
        deck.shuffle_cards
        expect(deck.cards).to_not eq(dummy)    
    end
end


end
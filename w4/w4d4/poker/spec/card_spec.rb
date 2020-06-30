require 'card'

describe Card do
    subject(:card) {Card.new(9, :spades)}
    describe "#initialize" do
        it "should set @number and @value to the given args" do
            expect(card.instance_variable_get(:@value)).to eq(:spades)
            expect(card.instance_variable_get(:@number)).to eq(9)
        end
    end
 
      


    describe "#value" do
        it "returns the value" do
            expect(card.value).to eq(:spades)
        end
    end

    describe "#number" do
        it "returns the number" do
            expect(card.number).to eq(9)
        end
    end


end


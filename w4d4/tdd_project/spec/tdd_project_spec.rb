require 'tdd_project'

describe "#my_uniq" do
    it "elements must be unique" do
       expect([1,1,2,3].my_uniq).to eq([1,2,3])
    end

    it "returns a new array" do
        new_arr = [1,1,2,3]
        expect(new_arr.my_uniq).to_not be(new_arr)
    end
    
end

describe "#two_sum" do
    it "adds" do
    new_arr = [1,1,2,3, -1, 3]
    expect(new_arr.two_sum).to eq([[0, 4], [1, 4]])
    end

    it "puts them in order" do
        new_arr = [1, -2,4,2,3, -1, -3]
        expect(new_arr.two_sum).to eq([[0, 5], [1,3], [4,6]])

    end

end

describe "#my_transpose" do
    it "transposes the array" do 
        rows = [
            [0, 1, 2],
            [3, 4, 5],
            [6, 7, 8]
                ]

        cols =  [ [0, 3, 6],
                [1, 4, 7],
                [2, 5, 8]
                    ]
    expect(rows.my_transpose).to eq(cols)
    end
    it "returns a new array" do
        rows = [
            [0, 1, 2],
            [3, 4, 5],
            [6, 7, 8]
                ]
        expect(rows.my_transpose).not_to be(rows)
    end

end
describe "#stock_picker" do
    it "returns the most profitable pair of days" do 
        expect([100, 50, 60, 60, 80].stock_picker).to eq([1,4])
    end

    it "should be in order" do
        a = [100, 50, 60, 60, 80].shuffle!.stock_picker
        expect(a[0]).to be < a[1]
    end
end

# describe Towers do
#     subject(:game) {Towers.new }
#     describe "#initialize" do
#         it "should create a board of size 3" do
#             expect(game.board.length).to eq(3)
#         end

#         it "should set the first array in order largest to smallest" do
#             expect(game.board[0]).to eq(game.board[0].sort.reverse)
#         end
  
#     end

#     describe "#move" do
#         it "takes of the end piece" do
#             expect(game.board[0]).to receive(:pop).with(game)
#             game.move
#         end


#     end
# end


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

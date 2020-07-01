require 'byebug'

class Code
  attr_reader :pegs
  
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  } # class constant

  def self.valid_pegs?(chars) # class method
    chars.all? {|char| POSSIBLE_PEGS.has_key?(char.upcase)} # hash.includes?(key)
  end

  def initialize(arr) # always refers to instance/ object being born
  
    raise if Code.valid_pegs?(arr) == false # need to refer to class
    @pegs = arr.map {|char| char.upcase}
  end

  def self.random(length)
    new_arr = []
    length.times { new_arr << POSSIBLE_PEGS.keys.sample }
    Code.new(new_arr) # passing new_arr into initialize .new is how you call initialize ~ creating an instance
  end

  def self.from_string(str)
    Code.new(str.split(''))
  end

  def [](idx)
    @pegs[idx]
  end

  def length 
    @pegs.length 
  end

  def num_exact_matches(code)
    count = 0 
    (0 ... code.length).each do | i | 
      count += 1 if code[ i ] == self[ i ] # self refers to  'internal instance'   self[i] == self.[](i)
    end
    count
  end

  def num_near_matches(guess)
    count = 0
    (0...guess.length).each do |idx|
      count += 1 if @pegs.include?(guess[idx])
    end
    count - guess.num_exact_matches(self) #self.num_exact_matches(guess) # == guess.num_exact_matches(self) 
  end

  def ==(code)
    self.pegs == code.pegs
  end 
end

#self refers to instance 
#self.class refers to the class itself but just put the name of the class
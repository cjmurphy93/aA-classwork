# PHASE 2
def convert_to_int(str)
  begin
  Integer(str)
rescue ArgumentError 
puts "Can't convert input to an integer"
end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

class CoffeeError < StandardError 
  def message
    puts "I love, coffee! But I need fruit! Try again:"
  end
end

class InvalidFruitError < StandardError
  def message
    puts "I hate that fruit"
  end
end

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise CoffeeError
  else
    raise InvalidFruitError
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  begin
  puts "puts Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  reaction(maybe_fruit)
  rescue  CoffeeError => e
    puts e.message
    retry
  rescue InvalidFruitError => e
    puts e.message
  end
end  

# PHASE 4
# class YearsError < StandardError
#   def message
#   end
# end

# class BlankError < StandardError

# end

class BestFriend
  def initialize( name = '', yrs_known = 0, fav_pastime = '')

  # raise YearsError.new("that's too short to be a best friend") if yrs_known < 5
  # BestFriends.new(J)
  
raise ArgumentError.new("You need a name!") if name.length < 1
raise ArgumentError.new("That is too short to be a best friend") if yrs_known.to_i < 5
raise ArgumentError.new("you need a hobby!") if fav_pastime.length < 1
  

    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end



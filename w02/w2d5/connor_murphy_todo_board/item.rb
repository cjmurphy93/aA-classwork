require 'byebug'
class Item

    attr_accessor :title, :description
    attr_reader :deadline, :done
# Item::valid_date?(date_string)
# This method should accept a string and return a 
# boolean indicating if it is valid date of the form 
# YYYY-MM-DD where Y, M, and D are numbers, such as 1912-06-23. 
# The month should be a number from 1 to 12 and the day should be a 
# number from 1 to 31. Here are examples of the expected behavior:

# p Item.valid_date?('2019-10-25') # true
# p Item.valid_date?('1912-06-23') # true
# p Item.valid_date?('2018-13-20') # false
# p Item.valid_date?('2018-12-32') # false
# p Item.valid_date?('10-25-2019') # false
# For simplicity, we'll be using well-formed strings to represent our 
# dates. However, if we were building this application for real users, 
# then we would use a more robust solution like Ruby's Date objects. This 
# would allow us to implement advanced features like time of day, timezone, 
# and other niceties. We'll save that battle for another day.

  def self.valid_date?(date)
    months = ("01".."12").to_a
    days = ("01".."31").to_a
    years = 1900
    # date.each_char do |char|
    # end
    parts = date.split("-")
    #debugger
    return false if parts.length != 3
    year = parts[0]
    month = parts[1]
    day = parts[2]
    return false if year.length != 4 || (month.length != 2 || day.length != 2)
    return false if !months.include?(month) || !days.include?(day)
    true
  end


# p Item.valid_date?('2019-10-25') # true
# p Item.valid_date?('1912-06-23') # true
# p Item.valid_date?('2018-13-20') # false
# p Item.valid_date?('2018-12-32') # false
# p Item.valid_date?('10-25-2019') # false


# Item#initialize(title, deadline, description)
# This method should accept a title, deadline, and a description as 
# arguments. These three pieces of data should be stored as instance 
# variables of an Item. If the deadline is not a valid date, raise an 
# error.

# For example, here are examples of two items being created successfully 
# and one invalid item:

  def initialize(title,deadline,description)
    if Item.valid_date?(deadline)
        @deadline = deadline
    else
        raise "error"
    end
    @title = title
    @description = description
    @done = false
  end

  def deadline=(new_deadline)
   # debugger
    if Item.valid_date?(new_deadline)
        @deadline = new_deadline
    else
        raise "error"
    end
  end

  def toggle
    @done = !@done
  end



end

# [1] pry(main)> load 'item.rb'
# => true

# [2] pry(main)> my_item = Item.new('Fix login page', '2019-10-42', 'It loads slow.')
# RuntimeError: deadline is not valid

# [3] pry(main)> my_item = Item.new('Fix login page', '2019-10-22', 'It loads slow.')
# => #<Item:0x
#         @deadline="2019-10-22",
#         @description="It loads slow.",
#         @title="Fix login page">

# [4] pry(main)> my_item.title
# => "Fix login page"

# [5] pry(main)> my_item.description = 'It loads waaaaaay too slow!'
# => "It loads waaaaaay too slow!"

# [6] pry(main)> my_item
# => #<Item:0x
#         @deadline="2019-10-22",
#         @description="It loads waaaaaay too slow!",
#         @title="Fix login page">

# [7] pry(main)> my_item.deadline = "10-23-2019"
# RuntimeError: deadline is not valid

# [8] pry(main)> my_item.deadline
# => "2019-10-22"

# [9] pry(main)> my_item.deadline = "2019-10-23"
# => "2019-10-23"

# [10] pry(main)> my_item.deadline
# => "2019-10-23"

# [11] pry(main)> my_item
# => #<Item:0x
#     @deadline="2019-10-23",
#     @description="It loads waaaaaay too slow!",
#      @title="Fix login page">

# Item.new('Fix login page', '2019-10-25', 'The page loads too slow.')

# my_item = Item.new(
#     'Buy Cheese',
#     '2019-10-23',
#     'We require American, Swiss, Feta, and Mozzarella cheese for the Happy hour!'
# )

#my_item.deadline = "10-23-2019"

# Item.new(
#     'Fix checkout page',
#     '10-25-2019',
#     'The font is too small.'
# ) # raises error due to invalid date

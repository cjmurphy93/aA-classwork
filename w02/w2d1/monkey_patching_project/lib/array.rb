# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    if self.length > 0
        return self.max - self.min
    else
        return nil
    end
  end

  def average
    if self.length > 0
        return self.sum / (self.length * 1.0)
    else
        return nil
    end
  end

  def median
    arr = self.sort
    if arr.length < 1
        return nil
    elsif arr.length % 2 == 0
        first_ele = arr[arr.length / 2]
        second_ele = arr[(arr.length / 2)- 1]
        return (first_ele + second_ele) / 2.0
    else
        return arr[arr.length / 2]
    end
  end

  def counts
    hash = Hash.new(0)
    self.each {|ele| hash[ele] += 1}
    hash
  end

  def my_count(val)
    count = 0
    self.each  {|ele| count += 1 if ele == val}
    count
  end

  def my_index(val)
    self.each.with_index {|ele,idx| return idx if val==ele}
    return nil
  end

  def my_uniq
    new_arr = []
    self.each do |ele|
        new_arr << ele if !new_arr.include?(ele)
    end
    new_arr
    
  end

  def my_transpose
    new_arr = Array.new(self.length) { Array.new(self.length) }
    self.each.with_index do |sub,i|
        sub.each.with_index do |ele,j|
            new_arr[j][i] = ele
        end
    end
    new_arr
  end
end

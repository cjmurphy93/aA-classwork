require 'byebug'

def reformat(s)
    numbers = "0123456789"
    alpha = "abcdefghijklmnopqrstuvwxyz"
    s_nums = []
    s_alpha = []
    chars = s.split("")
    chars.each do |char|
        if numbers.include?(char)
            s_nums << char
        elsif alpha.include?(char)
            s_alpha << char
        end
    end
    number_length = s_nums.length
    alpha_length = s_alpha.length
    difference = number_length - alpha_length 
    if difference >= 2 || difference <= -2
        return ""
    end
    new_arr = Array.new(s.length)
    new_arr.each_with_index do |ele, idx|
        if number_length > alpha_length
            if idx % 2 == 0 
                new_arr[idx] = s_nums.pop
            else
                new_arr[idx] = s_alpha.pop
            end
        else
            if idx % 2 == 0 
                new_arr[idx] = s_alpha.pop
            else
                new_arr[idx] = s_nums.pop
            end
        end
    end
    return new_arr.join
    
end

p reformat("covid2019")
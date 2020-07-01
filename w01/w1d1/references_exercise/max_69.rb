def maximum69_number (num)
    new_num = num.to_s
    solved = num.to_s
    new_num.each_char.with_index do |char, idx|
        if new_num[idx] == "6"
            solved[idx] = "9"
            break
        end
       
    end
 return solved.to_i

end

p maximum69_number(9669)
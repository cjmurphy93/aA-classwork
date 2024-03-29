require 'byebug'
def no_dupes?(arr)
    hash = Hash.new(0)
    arr.each {|ele| hash[ele] += 1}
    hash.select {|k,v| v == 1}.keys
end

# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []

#========================================================

def no_consecutive_repeats?(arr)
    (0...arr.length-1).each do |i|
        return false if arr[i] == arr[i+1]
    end
    true
end

# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?(['x'])                              # => true

#========================================================

def char_indices(str)
    hash = Hash.new {|h,k| h[k] = []}
    str.each_char.with_index do |char, i|
        hash[char] << i
    end
    hash
end

# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

#========================================================

def longest_streak(str)
  
    longest_streak = ""
    temp_streak = str[0]
    return str if str.length < 2
    (0...str.length-1).each do |i|
        if str[i] == str[i+1]
            temp_streak += str[i+1]
        else
            temp_streak = str[i+1]
        end
        longest_streak = temp_streak if temp_streak.length >= longest_streak.length
    end
    longest_streak
end

# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'
# p longest_streak('aac')         # => 'c'

def bi_prime?(num)
    factors = []
    (2...num).each {|n| factors << n if num % n == 0}
    (0...factors.length).each do |i1|
        (i1...factors.length).each do |i2|
            return true if factors[i1]*factors[i2] == num && (is_prime?(factors[i1]) && is_prime?(factors[i2]))
        end
    end
    false
end

def is_prime?(num)
    return false if num <2
    (2...num).none? {|factor| num % factor == 0}
end


# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false



def vigenere_cipher(message, keys)
    alpha = ("a".."z").to_a
    new_string = ""
    message.each_char.with_index do |char, i|
        old_i = alpha.index(char)
        new_i = (old_i + keys[i % keys.length]) % 26
        new_string += alpha[new_i]
    end
    new_string
end

# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"


def vowel_rotate(string)
    vowels = "aeiou"
    new_str = string
    vowel_indices = []
    letters = string.split("")
    
    string.each_char.with_index do |char, i|
        vowel_indices << i if vowels.include?(char)
    end
    rotated = vowel_indices.rotate(-1)
    #debugger
    vowel_indices.each_with_index do |v_idx, i|
       new_idx = rotated[i]
        new_str[v_idx] = letters[new_idx]
    end
    new_str

end


# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"

class String

    def select(&prc)
        new_str = ""
        return "" if prc == nil
        self.each_char {|char| new_str += char if prc.call(char)}
        new_str
    end

    def map!(&prc)
        self.each_char.with_index {|char, idx| self[idx] = prc.call(char, idx)}
    end



end

# p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# p "HELLOworld".select          # => ""

# word_1 = "Lovelace"
# word_1.map! do |ch| 
#     if ch == 'e'
#         '3'
#     elsif ch == 'a'
#         '4'
#     else
#         ch
#     end
# end
# p word_1        # => "Lov3l4c3"

# word_2 = "Dijkstra"
# word_2.map! do |ch, i|
#     if i.even?
#         ch.upcase
#     else
#         ch.downcase
#     end
# end
# p word_2        # => "DiJkStRa"

def multiply(a, b)
    return 0 if a == 0 || b == 0
    if b > 0
        a + multiply(a, b-1)
    else
       -(a + multiply(a, -b - 1))
    end

end

# p multiply(3, 5)        # => 15
# p multiply(5, 3)        # => 15
# p multiply(2, 4)        # => 8
# p multiply(0, 10)       # => 0
# p multiply(-3, -6)      # => 18
# p multiply(3, -6)       # => -18 
# p multiply(-3, 6)       # => -18 


def lucas_sequence(n)
    return [] if n == 0
    lucas_sequence(n-1)+[lucas_number(n)]
end

def lucas_number(n)
    return 2 if n == 1
    return 1 if n == 2
    lucas_number(n-1) + lucas_number(n-2)
end

# p lucas_sequence(0)   # => []
# p lucas_sequence(1)   # => [2]    
# p lucas_sequence(2)   # => [2, 1]
# p lucas_sequence(3)   # => [2, 1, 3]
# p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]


def prime_factorization(n)
    return [n] if is_prime?(n)

    # factors(n).each do |factor|
    #     return [prime_factorization(factor), prime_factorization(n/factor)].flatten
    # end
    factor = factors(n)[0]
    prime_factorization(factor) + prime_factorization(n/factor)
    
    
end

def factors(n)
    (2..n).select {|factor| n % factor == 0}
end

p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
p prime_factorization(25)     # => [5, 5]
p prime_factorization(60)     # => [2, 2, 3, 5]
p prime_factorization(7)      # => [7]
p prime_factorization(11)     # => [11]
p prime_factorization(2017)   # => [2017]
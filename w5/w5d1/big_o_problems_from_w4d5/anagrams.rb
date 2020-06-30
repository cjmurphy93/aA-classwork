def first_anagram?(word1, word2)
    words = word1.split("").permutation.to_a.map {|chars| chars.join}
    words.include?(word2)

end

# p first_anagram?("pea", "aep")
# p first_anagram?("pea", "app")

def second_anagram?(word1, word2)
    second_word = word2.split("")
    word1.each_char do |char|
        second_word.delete_at(second_word.find_index(char)) if second_word.include?(char)
    end
    second_word == []

end

# p second_anagram?("pea", "aep")
# p second_anagram?("far", "rafiki")
# p second_anagram?("rafiki", "far")

def third_anagram?(word1, word2)
    word1_chars = word1.split("").sort
    word2_chars = word2.split("").sort
    word1_chars == word2_chars

end

# p third_anagram?("pea", "aep")
# p third_anagram?("far", "rafiki")
# p third_anagram?("rafiki", "far")

def fourth_anagram?(word1, word2)
    letters = Hash.new(0)
    word1.each_char do |char|
        letters[char] += 1
    end
    word2.each_char do |char2|
        letters[char2] -= 1
    end
    letters.all? {|k,v| v ==0}
end

p fourth_anagram?("pea", "aep")
p fourth_anagram?("far", "rafiki")
p fourth_anagram?("rafiki", "far")
class Hangman
  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]


  def self.random_word 
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    indices = []

    @secret_word.each_char.with_index do |char_2, idx|
      if char == char_2
        indices << idx
      end
    end

    indices
  end

  def fill_indices(char, indices)
    indices.each do |i|
      @guess_word[i] = char
    end
  end

  def try_guess(char)
    if self.already_attempted?(char)
      print "that has already been attempted"
      return false
    else
      @attempted_chars << char
        if @secret_word.include?(char)
          idxs = self.get_matching_indices(char)
          self.fill_indices(char, idxs)
        else
          @remaining_incorrect_guesses -= 1
        end
      return true
    end
  end

  def ask_user_for_guess
    print 'Enter a char:'
    char = gets.chomp
    return self.try_guess(char)
  end

  def win?
    if @guess_word.join("") == @secret_word
      print "WIN"
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      print "LOSE"
      return true
    else 
      return false
    end
  end

  def game_over?
    if self.win? || self.lose?
      print @secret_word
      return true
    else
      return false
    end
  end
end

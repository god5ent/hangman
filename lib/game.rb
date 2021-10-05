class Game
  TOTAL_ERRORS_ALLOWED = 7

  def initialize(word)
    @letters = word.chars
    @user_guesses = []
  end

  def normalize_letter(letter)
    case letter
    when "Ё"
      "Е"
    when "Й"
      "И"
    else
      letter
    end
  end

  def normalized_letters
    @letters.map { |letter| normalize_letter(letter) }
  end

  def errors
    @user_guesses - normalized_letters
  end

  def errors_made
    errors.length
  end

  def errors_allowed
    TOTAL_ERRORS_ALLOWED - errors_made
  end

  def letters_to_guess
    @letters.map do |letter|
      if @user_guesses.include?(normalize_letter(letter))
        letter
      end
    end
  end

  def lost?
    errors_allowed == 0
  end

  def over?
    won? || lost?
  end

  def play!(letter)
    if !over? && !@user_guesses.include?(normalize_letter(letter))
      @user_guesses << normalize_letter(letter)
    end
  end

  def won?
    (normalized_letters - @user_guesses).empty? #чек
  end

  def word
    @letters.join
  end
end

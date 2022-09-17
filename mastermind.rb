class CodeMaker
  attr_accessor :name 
  def initialize(name)
    @name = name
    puts "The code maker is #{name}!"
  end
  def make_code
    puts "#{self.name} is making the code..." 
    sleep 1
    @code = rand(0..9).to_s + rand(0..9).to_s + rand(0..9).to_s + rand(0..9).to_s
    @code = @code.to_i

    puts "The code is now #{@code} via the make_code method" # test
    @code # so it returns the code value
  end
end

class CodeBreaker
  attr_accessor :name
  def initialize(name)
    @name = name
    puts "The Code Breaker is #{name}!"
  end
  def break_code
    puts "Code Breaker, enter your guess"
    guess = gets.chomp.to_i # to integer for the comparison to the code, later
    puts "The #{self.name}'s guess is #{guess}!"
    guess
  end
end

class Mastermind
  attr_accessor :codepegs1, :codepegs2, :codepegs3, 
  :codepegs4, :codepegs5, :codepegs6, 
  :codepegs7, :codepegs8, :codepegs9,
  :codepegs10, :codepegs11, :codepegs12,
  :keypegs1, :keypegs2, :keypegs3, 
  :keypegs4, :keypegs5, :keypegs6, 
  :keypegs7, :keypegs8, :keypegs9,
  :keypegs10, :keypegs11, :keypegs12,
  :winner, :round, :code, :player, :cpu

  def initialize(player, cpu, code) # passing in player and cpu objects
    @codepegs1
    @codepegs2
    @codepegs3
    @codepegs4
    @codepegs5
    @codepegs6
    @codepegs7
    @codepegs8
    @codepegs9
    @codepegs10
    @codepegs11
    @codepegs12
    @keypegs1
    @keypegs2
    @keypegs3
    @keypegs4
    @keypegs5
    @keypegs6
    @keypegs7
    @keypegs8
    @keypegs9
    @keypegs10
    @keypegs11
    @keypegs12
    @player = player
    @cpu = cpu
    @code = code
    @winner = false
    @round = 1 # To increment the guess in each row
  end

  def change_board(code_guess = player.break_code) # calling the break code method and using it in the change board method
    pegs = keypeg_calc(code_guess)
    case round
    when 1
      self.codepegs1 = code_guess
      self.keypegs1 = pegs
    when 2
      self.codepegs2 = code_guess
      self.keypegs2 = pegs
    when 3
      self.codepegs3 = code_guess
      self.keypegs3 = pegs
    when 4
      self.codepegs4 = code_guess
      self.keypegs4 = pegs
    when 5
      self.codepegs5 = code_guess
      self.keypegs5 = pegs
    when 6
      self.codepegs6 = code_guess
      self.keypegs6 = pegs
    when 7
      self.codepegs7 = code_guess
      self.keypegs7 = pegs
    when 8
      self.codepegs8 = code_guess
      self.keypegs8 = pegs
    when 9
      self.codepegs9 = code_guess
      self.keypegs9 = pegs
    when 10
      self.codepegs10 = code_guess
      self.keypegs10 = pegs
    when 11
      self.codepegs11 = code_guess
      self.keypegs11 = pegs
    when 12
      self.codepegs12 = code_guess
      self.keypegs12 = pegs
    else
      puts "Something wrong with the `round` variable"
    end
    show_board
    winner_check(code_guess)
  end

  def show_board
    puts "##- Guess - Keypegs !=exact, X=inexact, 0=miss"
    puts "01- #{@codepegs1} - #{@keypegs1}"
    puts "02- #{@codepegs2} - #{@keypegs2}"
    puts "03- #{@codepegs3} - #{@keypegs3}"
    puts "04- #{@codepegs4} - #{@keypegs4}"
    puts "05- #{@codepegs5} - #{@keypegs5}"
    puts "06- #{@codepegs6} - #{@keypegs6}"
    puts "07- #{@codepegs7} - #{@keypegs7}"
    puts "08- #{@codepegs8} - #{@keypegs8}"
    puts "09- #{@codepegs9} - #{@keypegs9}"
    puts "10- #{@codepegs10} - #{@keypegs10}"
    puts "11- #{@codepegs11} - #{@keypegs11}"
    puts "12- #{@codepegs12} - #{@keypegs12}"
  end

  def winner_check(code_guess)
    if @code == code_guess
      winner = true
      puts "Correct! The Code Breaker Wins!!!"
      return # break loop
    else
      # nada
    end
    # increment round since no winner
    self.round += 1
    while round == 13 do
      puts "GAME OVER, The Code Maker Wins!!!" # sensing no more guesses left
      return # break loop
    end
    change_board # keep playing!
  end

  def keypeg_calc(code_guess) # fxn to determine the keypegs from the guess so it prints
    code_guess_array = code_guess.to_s.split('').map(&:to_i)
    code_array = @code.to_s.split('').map(&:to_i)
    # DETERMINE HOW MANY TIMES A NUMBER APPEARS IN THE CODE in a nested array
    # So I can change elements of the nexted array individually: 
    # "omits the second optional argument and instead passes in the mutable value in a block."
    code_num_frequency = Array.new(9) {Array.new(2)}
    # add the number (guess) to each 1st position
    for i in 0..8 do
      code_num_frequency[i][0] = i+1
    end
    # then add the frequency to each 2nd position to finish the 
    # code_num_frequency nested array to regulate the keypegs
    for i in 0..8 do
      code_num_frequency[i][1] = code_array.count(i+1)
    end
    # If there are duplicates in the guess, 
    # they cannot all be awarded a key peg unless 
    # they correspond to the same number of duplicates in the code. 
    # Nested array of number of keypegs to compare to code_num_frequency
    peg_num_frequency = Array.new(9) {Array.new(2, 0)} # add a zero to each 2nd position
    # add the number (guess) to each 1st position
    for i in 0..8 do
      peg_num_frequency[i][0] = i+1
    end
    # first, check all spots for exact matches to avoid excluding them due to guesses-code duplicates
    keypeg_array = code_guess_array.map.with_index do |guess, index|
      if guess == code_array[index]
        peg_num_frequency[guess-1][1] += 1  # marking a direct hit
        "!"
      else
        "0"
      end
    end
    # second, need to check remaining spots for inexact matches "X"
    keypeg_array = code_guess_array.map.with_index do |guess, index|
      if keypeg_array[index] == "!"
        "!" # make it the same
      elsif code_array.include?(guess) && (peg_num_frequency[guess-1][1]) < (code_num_frequency[guess-1][1]) # there are unclaimed guesses remaining
        # add to the counter
        peg_num_frequency[guess-1][1] += 1 # marking an indirect hit
        "X" # then assign the mark
      else
        "0" # miss
      end
    end
    puts "keypeg_array now is #{keypeg_array}"
    keypeg_array.join("")
  end

end # class end

# GAME START SEQUENCE
puts "
\
Hello and welcome to Tygh's Mastermind game!"
puts "The computer will be the Code Maker and YOU will be the Code Breaker"
sleep 1
puts "Code Breaker, please type your name then hit return."
player_name = gets.chomp
sleep 1
player = CodeBreaker.new(player_name) # create player object
puts "Initializing your opponent..."
sleep 1
cpu = CodeMaker.new("Tygh's Laptop") # create cpu object
code = cpu.make_code # makes the code!
puts "OK, it's #{player.name} vs. #{cpu.name}, let's do this!"

newGame = Mastermind.new(player, cpu, code)
# newGame.show_board
newGame.change_board

# - 12 turns to guess the secret code, starting with you guessing the computer’s random code.
# - Later, refactor your code to allow the human player to choose whether they want to be the creator of the secret code or the guesser.

# Classes
# - Mastermind
# - Player < codemaker
# - Player < codebreaker

# Mastermind methods
	
# 	play:
# - The codemaker chooses a pattern of four code pegs (of six different colors). Players decide in advance whether duplicates and blanks are allowed.
# - codemaker chooses pattern (not visible to codebreaker)
# - The codebreaker tries to guess the pattern, in both order and color, within eight to twelve turns.
# - guesses and feedback continue to alternate until either the codebreaker guesses correctly, or all rows on the decoding board are full.
# - scoring: "The codemaker gets one point for each guess the codebreaker makes. An extra point is earned by the codemaker if the codebreaker is unable to guess the exact pattern within the given number of turns.
# - winner_check: "The winner is the one who has the most points after the agreed-upon number of games are played.

# display board (inspo: https://en.wikipedia.org/wiki/Mastermind_(board_game)#/media/File:Mastermind.jpg)
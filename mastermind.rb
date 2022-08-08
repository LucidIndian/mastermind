class CodeMaker
  
  attr_accessor :code, :name

  def initialize(name)
    @name = name
    puts "the code maker is #{name}!"
  end
  
end

class CodeBreaker

  attr_accessor :name 

  def initialize(name)
    @name = name
    puts "the code breaker is #{name}!"
  end

  def break_code
    puts "CodeBreaker, enter your guess"
    guess = gets.chomp
    puts "the code breaker's guess is #{guess}!"
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

  def initialize(player, cpu) # passing in objects
    @codepegs1 = [nil, nil, nil, nil]
    @codepegs2 = [nil, nil, nil, nil]
    @codepegs3 = [nil, nil, nil, nil]
    @codepegs4 = [nil, nil, nil, nil]
    @codepegs5 = [nil, nil, nil, nil]
    @codepegs6 = [nil, nil, nil, nil]
    @codepegs7 = [nil, nil, nil, nil]
    @codepegs8 = [nil, nil, nil, nil]
    @codepegs9 = [nil, nil, nil, nil]
    @codepegs10 = [nil, nil, nil, nil]
    @codepegs11 = [nil, nil, nil, nil]
    @codepegs12 = [nil, nil, nil, nil]
    @keypegs1 = [nil, nil, nil, nil]
    @keypegs2 = [nil, nil, nil, nil]
    @keypegs3 = [nil, nil, nil, nil]
    @keypegs4 = [nil, nil, nil, nil]
    @keypegs5 = [nil, nil, nil, nil]
    @keypegs6 = [nil, nil, nil, nil]
    @keypegs7 = [nil, nil, nil, nil]
    @keypegs8 = [nil, nil, nil, nil]
    @keypegs9 = [nil, nil, nil, nil]
    @keypegs10 = [nil, nil, nil, nil]
    @keypegs11 = [nil, nil, nil, nil]
    @keypegs12 = [nil, nil, nil, nil]
    @player = player
    @cpu = cpu
    @winner = false
    @round = 0
    @code = nil
  end
  
  def make_code
    puts "#{cpu} is making the code..." 
    sleep 2
    @code = 4321
    puts "the code is now #{code} at the make_code method"
    show_board
  end

  def change_board(code_guess)
    self.codepegs1 = code_guess.to_s.split('').map(&:to_i)
    show_board
  end


  def show_board
    puts "
    ________________________
    01- #{@codepegs1[0]}-#{@codepegs1[1]}-#{@codepegs1[2]}-#{@codepegs1[3]}-[][][][]
    ________________________
    02- #{@codepegs2[0]}-#{@codepegs2[1]}-#{@codepegs2[2]}-#{@codepegs2[3]}-[][][][]
    ________________________
    03- #{@codepegs3[0]}-#{@codepegs3[1]}-#{@codepegs3[2]}-#{@codepegs3[3]}-[][][][]
    ________________________
    04- _________________
    05- _________________
    06- _________________
    07- _________________
    08- _________________
    09- _________________
    10- _________________
    11- _________________
    12- _________________
    "

    winner_check

  end

  def winner_check
    if code == codepegs1
    winner = true
    else
     # nada
    end
    # increment round since now winner
    # write code to end the game if round = 12
    self.round += 1
  end

end # class end

player = CodeBreaker.new("Tygh")
cpu = CodeMaker.new("Tygh's Laptop")
sleep 1
newGame = Mastermind.new(player, cpu)
newGame.show_board
current_guess = player.break_code
newGame.change_board(current_guess)

# Classes: Player, Computer, Mastermind

# Player vs. computer

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
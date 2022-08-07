class CodeMaker
  
  attr_accessor :code, :name

  def initialize(name)
    @name = name
    @code = 0000
    puts "the code is now #{code} upon initialize"
    puts "the code maker is #{name}!"
  end
  
  def make_code
    puts "#{name} is making the code..." 
    sleep 2
    @code = 4321
    puts "the code is now #{code} upon make_code method"
  end
end

class CodeBreaker

  attr_accessor :name

  def initialize(name)
    @name = name
    puts "the code breaker is #{name}!"
  end

  def break_code(guess)
    # code
    puts "the code breaker's guess is #{guess}!"
  end
end

class Mastermind 

  def initialize(player, cpu) # passing in objects
    @codepeg1 = 1
    @codepeg2 = 2
    @codepeg3 = 3
    @codepeg4 = 4
    @keypegs = [nil, nil, nil, nil]
    @player = player
    @cpu = cpu
  end
  
  def show_board
    puts "
    ________________________
    1- #{@codepeg1}-#{@codepeg2}-#{@codepeg3}-#{@codepeg4}-[][][][]
    ________________________
    02- _________________
    ________________________
    03- _________________
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
  end

end # class end

player = CodeBreaker.new("Tygh")
cpu = CodeMaker.new("Tygh's Laptop")
sleep 2
cpu.make_code
newGame = Mastermind.new(player, cpu)
newGame.show_board


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
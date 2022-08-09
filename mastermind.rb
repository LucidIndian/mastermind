class CodeMaker
  
  attr_accessor :name

  def initialize(name)
    @name = name
    puts "The code maker is #{name}!"
  end

  def make_code
    puts "#{cpu} is making the code..." 
    sleep 2
    @code = 4321
    puts "the code is now #{code} at the make_code method"
    show_board
  end
  
end

class CodeBreaker

  attr_accessor :name

  def initialize(name)
    @name = name
    puts "The code breaker is #{name}!"
  end

  def break_code
    puts "Code Breaker, enter your guess"
    guess = gets.chomp
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
    @round = 1
    @code = nil
  end

  def change_board(code_guess = player.break_code)
  
    case round
    when 0
    when 1
      self.codepegs1 = code_guess.to_s.split('').map(&:to_i)
    when 2
      self.codepegs2 = code_guess.to_s.split('').map(&:to_i)
    when 3
      self.codepegs3 = code_guess.to_s.split('').map(&:to_i)
    when 4
      self.codepegs4 = code_guess.to_s.split('').map(&:to_i)
    when 5
      self.codepegs5 = code_guess.to_s.split('').map(&:to_i)
    when 6
      self.codepegs6 = code_guess.to_s.split('').map(&:to_i)
    when 7
      self.codepegs7 = code_guess.to_s.split('').map(&:to_i)
    when 8
      self.codepegs8 = code_guess.to_s.split('').map(&:to_i)
    when 9
      self.codepegs9 = code_guess.to_s.split('').map(&:to_i)
    when 10
      self.codepegs10 = code_guess.to_s.split('').map(&:to_i)
    when 11
      self.codepegs11 = code_guess.to_s.split('').map(&:to_i)
    when 12
      self.codepegs12 = code_guess.to_s.split('').map(&:to_i)
    else
      puts "Something wrong with the round variable"
    end
    show_board
    winner_check
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
    04- #{@codepegs4[0]}-#{@codepegs4[1]}-#{@codepegs4[2]}-#{@codepegs4[3]}-[][][][]
    ________________________
    05- #{@codepegs5[0]}-#{@codepegs5[1]}-#{@codepegs5[2]}-#{@codepegs5[3]}-[][][][]
    ________________________
    06- #{@codepegs6[0]}-#{@codepegs6[1]}-#{@codepegs6[2]}-#{@codepegs6[3]}-[][][][]
    ________________________
    07- #{@codepegs7[0]}-#{@codepegs7[1]}-#{@codepegs7[2]}-#{@codepegs7[3]}-[][][][]
    ________________________
    08- #{@codepegs8[0]}-#{@codepegs8[1]}-#{@codepegs8[2]}-#{@codepegs8[3]}-[][][][]
    ________________________
    09- #{@codepegs9[0]}-#{@codepegs9[1]}-#{@codepegs9[2]}-#{@codepegs9[3]}-[][][][]
    ________________________
    10- #{@codepegs10[0]}-#{@codepegs10[1]}-#{@codepegs10[2]}-#{@codepegs10[3]}-[][][][]
    ________________________
    11- #{@codepegs11[0]}-#{@codepegs11[1]}-#{@codepegs11[2]}-#{@codepegs11[3]}-[][][][]
    ________________________
    12- #{@codepegs12[0]}-#{@codepegs12[1]}-#{@codepegs12[2]}-#{@codepegs12[3]}-[][][][]
    "
  end

  def winner_check
    if code == codepegs1
    winner = true
    puts "there's a winner!!!!"
    else
     # nada
    end
    # increment round since now winner
    # write code to end the game if round = 12
    self.round += 1
    while round == 13 do
      puts "GAME OVER" # sensing no more gusses left
      return # break loop
    end
    change_board # keep playing!
  end
end # class end


# GAME START SEQUENCE
puts "
\
Hello and welcome to Tygh's Mastermind game!"
puts "The computer will be the Code Maker and YOU will be the Code Breaker"
sleep 1
puts "Player, please type your name then hit return."
player_name = gets.chomp
sleep 1
player = CodeBreaker.new(player_name)
puts "Initializing your opponent..."
cpu = CodeMaker.new("Tygh's Laptop")
sleep 1
puts "OK, it's #{player.name} vs. #{cpu.name}, let's do this!"
sleep 1

newGame = Mastermind.new(player, cpu)
newGame.show_board
newGame.change_board

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
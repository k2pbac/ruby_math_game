require './question'

class Game
include Question
  @@history = []
  attr_accessor :player_one_lives, :player_two_lives, :player_one_score, :player_two_score
  def initialize(player1, player2, mode)
    @player_one = player1 # String -> name
    @player_two = player2
    @round = 0
    @player_one_score = 0
    @player_two_score = 0
    @player_one_lives = 0
    @player_two_lives = 0
    @mode = mode
  end

  def starting_player()
    puts "Guess 0 for tails and 1 for heads to decide who goes first"
    number = gets.chomp.to_i
    while number != 0 && number != 1
      puts "Please guess either 0 or 1!"
      number = gets.chomp.to_i
    end
    real_number = rand(2)
    if number === real_number
      puts "#{@player_one.name} goes first"
      "#{@player_one.name} (player1)"
    else 
      puts "#{@player_two.name} goes first"
      "#{@player_two.name} (player2)"
    end
  end

  def start_game()
    @round = 1
    player = self.starting_player()
    start_round(player)
  end

  def start_round(player)
    @round += 1
    new_question = generate_question(@mode)
    puts new_question
    puts "#{player}: #{new_question[:question]}"
  end

end
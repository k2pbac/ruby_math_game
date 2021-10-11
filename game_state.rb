require './question'

class Game
include Question
  @@history = []
  attr_accessor 
  def initialize(player1, player2, mode)
    @current_game = true
    @next_player = nil
    @player_one = {:name => player1.name, :score => 0, :lives => 3} 
    @player_two = {:name => player2.name, :score => 0, :lives => 3}
    @round = 0
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
      @next_player = @player_two
      @player_one
    else 
      @next_player = @player_one
      @player_two
    end
  end

  def start_game()
    player = self.starting_player()
    start_round(player)
  end

  def start_round(player)
    @round += 1
    if @round != 1
      puts "P1: Score: #{@player_one[:score]}, Lives: #{@player_one[:lives]}"
      puts "P2: Score: #{@player_two[:score]}, Lives: #{@player_two[:lives]}"
      puts "----- NEW TURN -----"
    end
    new_question = generate_question(@mode)
    puts "#{player[:name]}: #{new_question[:question]}"
    player_answer = gets.chomp.to_i
    if player_answer === new_question[:answer].to_i
      update_player_score(player)
    else
      remove_player_life(player)
    end
    if player == @player_one
      @next_player = @player_two
    else
      @next_player = @player_one
    end 
    if @current_game
      self.start_round(@next_player)
    end
  end

  def update_player_score(player)
    player[:score] += 1
  end

  def remove_player_life(player)
    if player[:lives] - 1 <= 0 
      player[:lives] -= 1
      end_game()
    else
      player[:lives] -= 1
    end
  end

  def get_winner()
    if @player_one[:lives] <= 0
      @player_two
    else
      @player_one
    end
  end

  def end_game()
    winner = self.get_winner
    puts "Game over!"
    puts "The winner is #{winner[:name]} with a score of #{winner[:score]}"    
    @current_game = false
  end


end
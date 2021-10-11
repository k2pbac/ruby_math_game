require './question'

class Game
include Question
  @@history = []
  attr_accessor 
  def initialize(player1, player2, mode)
    @current_game = true
    @next_player = nil
    @player_one = {:player => player1, :name => player1.name, :score => 0, :lives => 3} 
    @player_two = {:player => player2, :name => player2.name, :score => 0, :lives => 3}
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
    player = self.starting_player
    start_round(player)
  end

  def start_round(player)
    @round += 1
    if @round != 1
      puts "P1: Score: #{@player_one[:score]}, Lives: #{@player_one[:lives]} | P2: Score: #{@player_two[:score]}, Lives: #{@player_two[:lives]}"
      puts "----- NEW TURN -----"
    end
    new_question = generate_question(@mode)
    puts "#{player[:name]}: #{new_question[:question]}"
    player_answer = gets.chomp.to_i
    if player_answer === new_question[:answer].to_i
      puts "#{player[:name]}: YES! You are correct!"
      update_player_score(player)
    else
      puts "#{player[:name]}: Seriously? No!"
      remove_player_life(player)
    end
    self.set_next_player(player)
    if @current_game
      self.start_round(@next_player)
    end
  end

  def set_next_player(player)
    if player == @player_one
      @next_player = @player_two
    else
      @next_player = @player_one
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

  def get_final_results()
    if @player_one[:lives] <= 0
      @player_one[:player].losses += 1
      @player_two[:player].wins += 1
      {:winner => @player_two, :loser => @player_one}
    else
      @player_one[:player].wins += 1
      @player_two[:player].losses += 1
      {:winner => @player_one, :loser => @player_two}
    end
  end

  def end_game()
    game_results = self.get_final_results
    @@history.push(game_results)
    puts "-----GAME OVER -----"
    puts "The winner is #{game_results[:winner][:name]} with a score of #{game_results[:winner][:score]}"    
    @current_game = false
  end
end
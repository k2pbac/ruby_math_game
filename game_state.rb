class Game
  @@history = []
  attr_accessor :round
  def initialize(player1, player2)
    @player_one = player1 # String -> name
    @player_two = player2
    @round = 0
    @player_one_score = 0
    @player_two_score = 0
  end



end
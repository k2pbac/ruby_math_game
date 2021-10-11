

require ("./game_state");
require ("./player")


player1 = Player.new("Kris")
player2 = Player.new("Computer")


# game = Game.new(player1, player2, 'Easy')
game = Game.new(player1, player2, 'Medium')
# game = Game.new(player1, player2, 'Hard')

game.start_game()

puts "Player 1 wins:  #{player1.wins}"
puts "Player 2 wins:  #{player2.wins}"
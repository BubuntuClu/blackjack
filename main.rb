require_relative 'game.rb'
require_relative 'actor.rb'
require_relative 'player.rb'
require_relative 'hand.rb'
require_relative 'card.rb'

game = Game.new
loop do
  puts 'Do you want to play?(y/n)'
  ans = gets.chomp.to_s.downcase
  if ans == 'y'
    if game.can_player_play? && game.can_dealer_play?
      game.play_round
      game.end_round
    else
      puts 'U havent got enought money to play!Bye' unless game.can_player_play?
      puts 'Dealer havent got enought money to play!U r lucky one!!!' unless game.can_dealer_play?
      break
    end
  end
  if ans == 'n'
    puts 'See u next time. Bye!'
    break
  end
end

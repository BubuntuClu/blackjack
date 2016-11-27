require_relative 'actor.rb'
require_relative 'player.rb'

class Game

  PLAYERS_COUNT = 1
  attr_accessor :players, :bet

  def initialize
    self.players = []
    self.bet = 0
    self.players << Actor.new("dealer")
    i = 1
    while self.players.size - 1 < PLAYERS_COUNT do
      # puts "Whats name of player #{i}?"
      # name = gets.chomp.to_s
      self.players << Player.new("test")
    end
  end

  def stop?
  end

  def who_win
  end

  def play_round
    self.players.each do |player|
      2.times { player.take_card }      
      puts "#{player.name} score is : #{player.show_current_score}" if player.instance_of?Player
      player.bank -=10
      self.bet += 10
    end
  end

  def end
  end
end

g = Game.new
g.play_round
puts g.bet
puts g.players[0].bank
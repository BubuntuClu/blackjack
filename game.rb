require_relative 'actor.rb'
require_relative 'player.rb'

class Game

  PLAYERS_COUNT = 1
  attr_accessor :players

  def initialize
    self.players = []
    self.players << Actor.new("dealer")
    i = 1
    while self.players.size - 1 < PLAYERS_COUNT do
      puts "Whats name of player #{i}?"
      name = gets.chomp.to_s
      self.players << Player.new(name)
    end
  end

  def stop?
  end

  def who_win
  end

  def play_round
  end

  def end
  end
end
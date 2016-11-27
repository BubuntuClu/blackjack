require_relative 'actor.rb'
require_relative 'player.rb'
require_relative 'deck.rb'

class Game

  attr_accessor :players, :bet

  def initialize
    self.players = []
    self.bet = 0
    
      # puts "Whats name of player #{i}?"
      # name = gets.chomp.to_s
    self.players << Player.new("test")
    self.players << Actor.new("dealer")
  end

  def play_round
    Deck.prepare_deck
    self.players.each do |player|
      2.times { player.take_card }  
      if player.instance_of?Player    
        player_info(player)
      end 
      player.bank -=10
      self.bet += 10
    end

    self.players.each do |player|
      if player.instance_of?Player
        puts "what u can do:"
        puts "1. pass"
        puts "2. take card"
        puts "3. open cards"
        i = gets.chomp.to_i
        case i
        when 1
          puts "u want to pass"
        when 2
          puts "u take card"
          player.take_card
        when 3 
          break
        else
        end
      else
        if player.hand.get_total < 18
          player.take_card
          puts "#{player.name} score is : #{player.show_current_score}"
        else
          puts " dealer turn"
        end
      end
    end
    who_win
  end

  def who_win
    player_info(players[0])
    player_info(players[-1])
    if players[0].hand.get_total == players[-1].hand.get_total && players[0].hand.get_total < 22
      players[0].bank += self.bet/2
      players[-1].bank += self.bet/2
      puts "Draw!"
    end

    if players[0].hand.get_total > players[-1].hand.get_total && players[0].hand.get_total < 22
      players[0].bank += self.bet
      puts "YOU WIN!!"
    end

    if players[0].hand.get_total < players[-1].hand.get_total && players[0].hand.get_total < 22
      players[-1].bank += self.bet
      puts "YOU LOSE!!"
    end

    if players[-1].hand.get_total > 21 && players[0].hand.get_total > 21
      puts "No one get the bank!!"
    end
    self.bet = 0
    puts "#{players[0].name} bank is : #{players[0].bank}"
    puts "#{players[-1].name} bank is : #{players[-1].bank}"
  end

  def end_round
    self.players.each do |player|
      player.hand.clear_hand
    end
  end

  def can_player_play?
    false if players[0].bank == 0
    true
  end

  private
  def player_info(player)
    puts "#{player.name} score is : #{player.show_current_score}" 
    puts "#{player.name} ur cards are : #{player.show_hand}"
  end
end

require_relative 'actor.rb'
require_relative 'player.rb'
require_relative 'deck.rb'

class Game

  attr_accessor :players, :bet
  BANK = 100

  def initialize
    self.players = []
    self.bet = 0
    
      # puts "Whats name of player #{i}?"
      # name = gets.chomp.to_s
    self.players << Player.new("test",BANK)
    self.players << Actor.new("dealer",BANK)
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
        player.what_player_can_do
        action = gets.chomp.sub(' ','_').downcase
        
        case action
        when "show_cards"
          break
         else
          player.do_action(action.to_sym)
         end
      else
        if player.hand.get_total < 18
          player.do_action("take_card".to_sym)
        else
          player.do_action("pass".to_sym)
        end
      end
    end
    who_win
  end

  def who_win
    player_info(players[0])
    player_info(players[-1])
    ps = players[0].hand.get_total
    ds = players[-1].hand.get_total
    if ps == ds && ps < 22
      players[0].bank += self.bet/2
      players[-1].bank += self.bet/2
      puts "Draw!"
    end

    if (ps > ds && ps < 22) || (ps < 22 && ds > 21)
      players[0].bank += self.bet
      puts "YOU WIN!!"
    end

    if (ps < ds && ps < 22 && ds < 22) || (ps > 21 && ds < 22)
      players[-1].bank += self.bet
      puts "YOU LOSE!!"
    end

    if ds > 21 && ps > 21
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
    return true if players[0].bank > 0
    false
  end

  def can_dealer_play?
    return true if players[-1].bank > 0
    false
  end

  private
  def player_info(player)
    puts "#{player.name} score is : #{player.show_current_score}" 
    puts "#{player.name} ur cards are : #{player.show_hand}"
  end
end

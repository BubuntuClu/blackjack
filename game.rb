require_relative 'actor.rb'
require_relative 'player.rb'
require_relative 'deck.rb'

class Game
  BANK = 100

  def initialize
    self.players = []
    self.bet = 0
    players << Player.new(BANK)
    players << Actor.new('dealer', BANK)
  end

  def play_round
    Deck.prepare_deck
    players.each do |player|
      2.times { player.take_card }
      player_info(player) if player.instance_of?Player
      player.bank -= 10
      self.bet += 10
    end

    players.each do |player|
      puts '---------------------'
      puts "turn #{player.name}"
      if player.instance_of?Player
        begin
           puts 'what u can do:'
           player.what_player_can_do
           action = gets.chomp.sub(' ', '_').downcase

           case action
           when 'show_cards'
             break
           else
             player.do_action(action.to_sym)
            end
         rescue StandardError
           puts 'no such action'
           retry
         end
      else
        if player.hand.score < 18
          player.do_action('take_card'.to_sym)
        else
          player.do_action('pass'.to_sym)
        end
      end
    end
    puts '---------------------'
    who_win
  end

  def who_win
    player_info(players[0])
    player_info(players[-1])
    ps = players[0].hand.score
    ds = players[-1].hand.score
    if ps == ds && ps < 22
      players[0].bank += self.bet / 2
      players[-1].bank += self.bet / 2
      puts 'Draw!'
    end

    if (ps > ds && ps < 22) || (ps < 22 && ds > 21)
      players[0].bank += self.bet
      puts 'YOU WIN!!'
    end

    if (ps < ds && ps < 22 && ds < 22) || (ps > 21 && ds < 22)
      players[-1].bank += self.bet
      puts 'YOU LOSE!!'
    end

    puts 'No one get the bank!!' if ds > 21 && ps > 21
    self.bet = 0
    puts "#{players[0].name} bank is : #{players[0].bank}"
    puts "#{players[-1].name} bank is : #{players[-1].bank}"
  end

  def end_round
    players.each do |player|
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

  protected

  attr_accessor :players, :bet

  def player_info(player)
    puts "#{player.name} score is : #{player.show_current_score}"
    puts "#{player.name} ur cards are : #{player.show_hand}"
  end
end

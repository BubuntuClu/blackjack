require_relative 'hand.rb'
require_relative 'actions.rb'

class Actor
  include ActionMethods
  attr_accessor :name, :bank, :hand

  def initialize(name, bank)
    self.name = name
    self.bank = bank
    self.hand = Hand.new
    action!
  end

  def pass
    puts "u just w8 for opponent's turn"
  end

  def take_card
    hand.add_card
  end

  def show_current_score
    hand.score
  end

  def show_hand
    hand.show_hand
  end

  private

  actions :pass, :take_card
end

require_relative 'hand.rb'
require_relative 'actions.rb'

class Actor
  include ActionMethods
  attr_accessor :name, :bank, :hand
  actions :pass, :take_card

  def initialize(name,bank)
    self.name = name
    self.bank = bank
    self.hand = Hand.new
    action!
  end

  def pass
  end

  def take_card
    self.hand.add_card
  end

  def show_current_score
    self.hand.get_total
  end

  def show_hand
    self.hand.show_hand
  end

end
require_relative 'hand.rb'

class Actor
  attr_accessor :name, :bank, :hand
  # actions :pass, :take_card

  def initialize(name)
    self.name = name
    self.bank = 100
    self.hand = Hand.new
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
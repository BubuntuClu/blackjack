require_relative 'hand.rb'

class Actor
  attr_accessor :name, :bank, :cards
  actions :pass, :take_card

  def initialize(name)
    self.name = name
    self.bank = 100
    self.cards = Hand.new()
  end

end
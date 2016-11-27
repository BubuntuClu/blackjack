class Hand
  attr_accessor :cards

  def initialize
    self.cards = []
  end

  def add_card
    # cards << card
    self.cards << 2
  end

  def clear_hand
    self.cards.clear
  end

  def get_total
    total = 0
    self.cards.each do |card|
      total += card
    end
    total
  end
end
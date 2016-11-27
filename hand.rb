class Hand
  attr_accessor :cards

  def initialize
    self.cards = []
  end

  def add_card
    self.cards << Deck.get_card
  end

  def clear_hand
    self.cards.clear
  end

  def get_total
    total = 0
    self.cards.each do |card|
      value = card.get_value
      if value == 11 && value + total > 21
        total += 1
      else
        total += value
      end
    end
    total
  end

  def show_hand
    hand = ""
    self.cards.each do |card|
      hand += card.show_card
    end
    hand
  end

end
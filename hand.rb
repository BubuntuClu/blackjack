class Hand
  def initialize
    self.cards = []
  end

  def add_card
    cards << Deck.give_card
  end

  def clear_hand
    cards.clear
  end

  def score
    total = 0
    cards.each do |card|
      value = card.value
      total += if value == 11 && value + total > 21
                 1
               else
                 value
               end
    end
    total
  end

  def show_hand
    hand = ''
    cards.each do |card|
      hand += card.show_card
    end
    hand
  end

  private

  attr_accessor :cards
end

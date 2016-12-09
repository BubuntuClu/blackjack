class Deck
  @@cards = []

  def self.prepare_deck
    @@cards = []
    ranks = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
    suits = %w(+ <3 ^ <>)
    suits.each do |suit|
      ranks.size.times do |rank|
        @@cards << Card.new(ranks[rank], suit)
      end
    end
  end

  def self.give_card
    card = @@cards[rand(@@cards.size)]
    @@cards.delete(card)
    card
  end
end

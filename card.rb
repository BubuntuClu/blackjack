class Card
  attr_accessor :rank, :suit
  def initialize(rank, suit)
    self.rank = rank
    self.suit = suit
  end

  def show_card
    "#{self.rank}#{self.suit} "
  end

  def get_value
    return 10 if ["J","Q","K"].include?self.rank
    return self.rank.to_i if (2..10).to_a.include?self.rank.to_i
    return 11 if self.rank == "A"
  end
end

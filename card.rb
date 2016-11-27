class Card
  def initialize(rank, suit)
    self.rank = rank
    self.suit = suit
  end

  def show_card
    "#{rank}#{suit} "
  end

  def value
    return 10 if %w(J Q K).include?rank
    return rank.to_i if (2..10).to_a.include?rank.to_i
    return 11 if rank == 'A'
  end

  private

  attr_accessor :rank, :suit
end

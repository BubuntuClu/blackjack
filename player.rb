class Player < Actor
  include ActionMethods
  require_relative 'actions.rb'

  def initialize(bank)
    puts 'Whats name of player?'
    name = gets.chomp.to_s
    super(name, bank)
  end

  private

  actions :pass, :take_card, :show_cards
end

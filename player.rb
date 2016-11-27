class Player < Actor
  include ActionMethods
  require_relative 'actions.rb'
  actions :pass, :take_card, :show_cards

  def initialize(name,bank)
    super(name,bank)
  end

end
class Player
  attr_reader :name, :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
    @has_lost = false
  end

end

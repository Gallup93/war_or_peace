class Player
  attr_reader :name, :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
    @has_lost = false
  end

  #checks if players deck is empty
  def has_lost?(kill)
    if (@deck.cards.empty? == true || kill == true)
      @has_lost = true
    else
      @has_lost
    end
  end

end

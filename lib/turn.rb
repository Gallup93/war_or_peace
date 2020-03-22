class Turn
  attr_reader :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if @player1.deck.cards[0].rank != @player2.deck.cards[0].rank
      :basic
    elsif
      (@player1.deck.cards[0].rank == @player2.deck.cards[0].rank) &&
      (@player1.deck.cards[2].rank == @player2.deck.cards[2].rank)
      :mutually_assured_destruction
    else
      :war
    end
  end

  def winner
    if type == :basic
      if @player1.deck.cards[0].rank > @player2.deck.cards[0].rank
        @player1
      else
        @player2
      end
    elsif type == :war
      if @player1.deck.cards[2].rank > @player2.deck.cards[2].rank
        @player1
      else
        @player2
      end
    else
      nil
    end
  end


end

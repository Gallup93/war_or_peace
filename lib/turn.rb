class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  #checks players decks to determine type of round being played
  #if any deck is < 3, game is killed and that player loses.
  def type

    if (@player1.deck.cards.count < 3 || @player2.deck.cards.count < 3)
      if @player1.deck.cards.count < 3
        @player1.has_lost?(true)
      else
        @player2.has_lost?(true)
      end
    else
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
  end

  #identifies winner based on type of round
  def winner(returned_type)
    if returned_type == :basic
      if @player1.deck.cards[0].rank > @player2.deck.cards[0].rank
        @player1
      else
        @player2
      end
    elsif returned_type == :war
      if @player1.deck.cards[2].rank > @player2.deck.cards[2].rank
        @player1
      else
        @player2
      end
    else
      "No Winner"
    end
  end

  #removes staked cards from player deck
  #sends staked cards to spoils_of_war
  def pile_cards
    if type == :basic
      @spoils_of_war << @player1.deck.cards[0]
      @spoils_of_war << @player2.deck.cards[0]
      @player1.deck.cards.shift
      @player2.deck.cards.shift
    elsif type == :war
      @spoils_of_war << @player1.deck.cards[0]
      @spoils_of_war << @player1.deck.cards[1]
      @spoils_of_war << @player1.deck.cards[2]
      @spoils_of_war << @player2.deck.cards[0]
      @spoils_of_war << @player2.deck.cards[1]
      @spoils_of_war << @player2.deck.cards[2]
      @player1.deck.cards.shift(3)
      @player2.deck.cards.shift(3)
    else
      @player1.deck.cards.shift(3)
      @player2.deck.cards.shift(3)
      p "MUTALLY ASSURED DESTRUCTION"
    end
  end

  #sends spoils_of_war to winners deck
  #clears spoils_of_war for next turn
  def award_spoils(winner)
    if winner == @player1
      @spoils_of_war.each do |card|
        @player1.deck.add_card(card)
      end
    elsif winner == @player2
      @spoils_of_war.each do |card|
        @player2.deck.add_card(card)
      end
    else
      p "NO WINNER. ALL SPOILS."
    end
    @spoils_of_war = []
  end

end

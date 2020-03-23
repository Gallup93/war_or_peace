class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  #returns rank of card at given index
  def rank_of_card_at(index)
    @cards[index].rank
  end

  #returns all high ranking cards (> 11)
  def high_ranking_cards
    high_ranks = @cards.map do |element|
        if element.rank > 11
          element
        end
    end
    high_ranks.compact
  end

  #returns percent of cards high ranking
  def percent_high_ranking

    percent = ((high_ranking_cards.count.to_f / @cards.count.to_f) * 100)
    percent.round(2)

  end

  #removes top card from deck
  def remove_card
    @cards.shift
  end

  #adds card to bottom of deck
  def add_card(new_card)
    @cards << new_card
  end

end

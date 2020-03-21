class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
    high_ranks = @cards.map do |element|
        if element.rank > 11
          element
        end
    end
    high_ranks.compact
  end

end

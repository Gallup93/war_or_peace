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

  def percent_high_ranking
    # require "pry"; binding.pry

    percent = ((high_ranking_cards.count.to_f / @cards.count.to_f) * 100)
    percent.round(2)


  end


end

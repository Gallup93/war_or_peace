require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'


class TurnTest < Minitest::Test
  #sets up instances of Turn
  def setup
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card3 = Card.new(:heart, '9', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, '8', 8)
    @card6 = Card.new(:diamond, 'Queen', 12)
    @card7 = Card.new(:heart, '3', 3)
    @card8 = Card.new(:diamond, '2', 2)

    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card3, @card4, @card6, @card7])

    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)

    @turn = Turn.new(@player1, @player2)
  end

  #tests instance of Turn and confirms it has players
  def test_initialization

    assert_instance_of Turn, @turn
    assert_equal @player1, @turn.player1
    assert_equal @player2, @turn.player2
  end

  #test type method returns expected type
  def test_type
    assert_equal :basic, @turn.type
  end

  #test winner method
  def test_winner
    assert_equal @player1, @turn.winner(:basic)
  end

  #test pile_cards method
  def test_pile_cards
    assert_equal @card3 ,@turn.pile_cards
  end

  #test award_spoils method
  def test_award_spoils
    @turn.pile_cards
    assert_equal [], @turn.award_spoils(@turn.winner(:basic))
  end
end

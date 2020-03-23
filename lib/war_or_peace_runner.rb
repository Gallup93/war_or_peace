require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class Runner

  #initializes instance of Turn with two players splitting a randomized deck of 52 cards
  def initialize
    cards = [
        card1 = Card.new(:heart, '2', 2),
        card2 = Card.new(:heart, '3', 3),
        card3 = Card.new(:heart, '4', 4),
        card4 = Card.new(:heart, '5', 5),
        card5 = Card.new(:heart, '6', 6),
        card6 = Card.new(:heart, '7', 7),
        card7 = Card.new(:heart, '8', 8),
        card8 = Card.new(:heart, '9', 9),
        card9 = Card.new(:heart, '10', 10),
        card10 = Card.new(:heart, 'jack', 11),
        card11 = Card.new(:heart, 'queen', 12),
        card12 = Card.new(:heart, 'king', 13),
        card13 = Card.new(:heart, 'ace', 14),

        card14 = Card.new(:club, '2', 2),
        card15 = Card.new(:club, '3', 3),
        card16 = Card.new(:club, '4', 4),
        card17 = Card.new(:club, '5', 5),
        card18 = Card.new(:club, '6', 6),
        card19 = Card.new(:club, '7', 7),
        card20 = Card.new(:club, '8', 8),
        card21 = Card.new(:club, '9', 9),
        card22 = Card.new(:club, '10', 10),
        card23 = Card.new(:club, 'jack', 11),
        card24 = Card.new(:club, 'queen', 12),
        card25 = Card.new(:club, 'king', 13),
        card26 = Card.new(:club, 'ace', 14),

        card27 = Card.new(:diamond, '2', 2),
        card28 = Card.new(:diamond, '3', 3),
        card29 = Card.new(:diamond, '4', 4),
        card30 = Card.new(:diamond, '5', 5),
        card31 = Card.new(:diamond, '6', 6),
        card32 = Card.new(:diamond, '7', 7),
        card33 = Card.new(:diamond, '8', 8),
        card34 = Card.new(:diamond, '9', 9),
        card35 = Card.new(:diamond, '10', 10),
        card36 = Card.new(:diamond, 'jack', 11),
        card37 = Card.new(:diamond, 'queen', 12),
        card38 = Card.new(:diamond, 'king', 13),
        card39 = Card.new(:diamond, 'ace', 14),

        card40 = Card.new(:spade, '2', 2),
        card41 = Card.new(:spade, '3', 3),
        card42 = Card.new(:spade, '4', 4),
        card43 = Card.new(:spade, '5', 5),
        card44 = Card.new(:spade, '6', 6),
        card45 = Card.new(:spade, '7', 7),
        card46 = Card.new(:spade, '8', 8),
        card47 = Card.new(:spade, '9', 9),
        card48 = Card.new(:spade, '10', 10),
        card49 = Card.new(:spade, 'jack', 11),
        card50 = Card.new(:spade, 'queen', 12),
        card51 = Card.new(:spade, 'king', 13),
        card52 = Card.new(:spade, 'ace', 14),
    ].shuffle

    #splits cards into two decks
    deck1 = []
    deck2 = []
    player_deck = 1
    cards.each do |card|
      if player_deck == 1
        deck1 << card
        player_deck = 2
      else
        deck2 << card
        player_deck = 1
      end
    end

    #initialize instances of Deck, Player, Turn
    @deck1 = Deck.new(deck1)
    @deck2 = Deck.new(deck2)

    @player1 = Player.new('Mihcael', @deck1)
    @player2 = Player.new('Bug', @deck2)

    @turn = Turn.new(@player1, @player2)
  end

end

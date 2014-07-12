class Card
  include Comparable

  #Initial Constant
  SUITS = "CDHS"
  FACES = "L23456789TJQKA"
  SUIT_VALUES = {
    "C" => 0,
    "D" => 1,
    "H" => 2,
    "S" => 3,
  }
  FACE_VALUES = {
    "L" => 1,
    "2" => 2,
    "3" => 3,
    "4" => 4,
    "5" => 5,
    "6" => 6,
    "7" => 7,
    "8" => 8,
    "9" => 9,
    "T" => 10,
    "J" => 11,
    "Q" => 12,
    "K" => 13,
    "A" => 14,
  }

  attr_reader :face, :suit, :value

  def self.face_value(face)
    if FACE_VALUES.has_key? face
      FACE_VALUES[face] - 1
    else
      nil
    end
  end


  def initialize(card)
    raise TypeError, "Invalid Card: card should be String" unless card.is_a? String
    face = card[0, 1]
    suit = card[1, 1]
    @face = Card::face_value(face)
    @suit = SUIT_VALUES[suit]
    @value = @suit * FACES.size + @face - 1
  end

  def to_s
    FACES[@face] + SUITS[@suit]
  end

  def <=> other
    @face <=> other.face
  end

  def == other
    @value == other.value
  end
  alias_method :eql?, :==

  def hash
    @value.hash
  end
end

class Pocker
  include Comparable
  include Enumerable

  attr_reader :hand

  def initialize(cards)
    @hand = cards.scan(/\S{2}/).map { |card| Card.new(card) }
  end

  def cards
    @hand.join " "
  end

  def by_suit
    @hand.sort_by { |card| card.suit }.reverse
  end

  def by_face
    @hand.sort_by { |card| card.face }.reverse
  end

  def =~ (re)
    re.match(cards)
  end

  def royal_flush?
    by_suit =~ /A(.) K\1 Q\1 J\1 T\1/ ? true : false
  end

  def straight_flush?
    straight? && flush?
  end

  def four_of_a_kind?
    by_face =~ /(.). \1. \1. \1./ ? true : false
  end
end

pocker = Pocker.new("AS KD 3D JD 8H")
puts pocker.hand, pocker.by_suit

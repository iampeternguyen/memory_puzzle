require_relative("card.rb")


class Board
  attr_reader :cards


  def initialize(size)
    @cards = []
    @board = Array.new(size) {Array.new(size)}
    @num_pairs = (size*size) / 2
  end

  def populate
    create_card_pairs
    populate_board
  end

  def populate_board

  end

  def create_card_pairs
    @num_pairs.times do |time|
      2.times {@cards << Card.new(time)}
    end
    @cards.shuffle!
  end
end

if __FILE__ == $PROGRAM_NAME
  board = Board.new(4)
  board.populate
  p board.cards
end
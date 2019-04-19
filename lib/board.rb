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
    idx = 0
    (0...@board.length).each do |row|
      (0...@board.length).each do |col|
        @board[row][col] = @cards[idx]
        idx += 1
      end
    end
  end

  def create_card_pairs
    @num_pairs.times do |time|
      2.times {@cards << Card.new(time)}
    end
    @cards.shuffle!
  end

  def print_board
    @board.each_with_index do |row, idx1|
      if idx1 == 0
        print "  "
        row_headers = (0...row.length).to_a
        print row_headers.join(" ")
        print "\n"
      end
      row.each_with_index do |card, idx2|
        if idx2 == 0
          print idx1.to_s + " "
        end
        print card.to_s + " "
      end
      print "\n"
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  board = Board.new(4)
  board.populate
  board.print_board
end
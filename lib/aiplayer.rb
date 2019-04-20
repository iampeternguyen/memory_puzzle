class AiPlayer
  attr_accessor :known
  def initialize(board)
    @board = board.game_board
    @board_size = @board.length
    @known = Array.new(@board_size) {Array.new(@board_size)}
  end

  def get_input1
    card_value = get_known_pair_value
    input = card_value!=nil ? find_card_location(card_value) : get_hidden_card_locations.sample
  end

  def get_input2(pos1)
    row1, col1 = pos1
    card1 = @board[row1][col1]
    input = find_card_location(card1.value)
    input ||= get_hidden_card_locations.sample
    input
  end

  def get_hidden_card_locations
    locations = []
    @board.each_with_index do |row, idx1|
      row.each_with_index do |card, idx2|
        locations << [idx1, idx2] if card.is_face_down
      end
    end
    locations
  end

  def save_card(card, position)
    row, col = position
    @known[row][col] = card
  end

  def get_known_pair_value
    known_count = Hash.new(0)
    @known.flatten.each do |card|
      known_count[card.value] += 1 if card
    end

    revealed_count = Hash.new(0)
    @board.flatten.each do |card|
      revealed_count[card.value] += 1 if !card.is_face_down
    end

    revealed_pairs = revealed_count.keys.select {|k| revealed_count[k] == 2}

    known_count.each do |k, v|
      return k if v == 2 && !revealed_pairs.include?(k)
    end

    return nil
  end

  def find_card_location(value)
    @known.each_with_index do |row, idx1|
      row.each_with_index do |card, idx2|
        if card
          if card.value == value && card.is_face_down
            return [idx1, idx2]
          end
        end
      end
    end
    nil
  end

end
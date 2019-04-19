class AiPlayer
  attr_accessor :known
  def initialize(game_size)
    @board_size = game_size
    @known = Array.new(game_size) {Array.new(game_size)}
  end

  def get_input
    card_value = get_known_pair_value
    if card_value
      input = find_card(card_value)
    else
      input = [rand(@board_size), rand(@board_size)]
    end
    input
  end

  def save_card(card, position)
    row, col = position
    @known[row, col] = card
  end

  def get_known_pair_value
    count = Hash.new(0)
    @known.flatten.each do |card|
      count[card.value] += 1 if card
    end

    count.each do |k, v|
      return k if v == 2
    end
    return nil
  end

  def find_card(value)
    @known.each_with_index do |row, idx1|
      row.each_with_index do |card, idx2|
        if card.value == value
          @known[idx1][idx2] = true
          return [idx1, idx2]
        end
      end
    end
  end

end
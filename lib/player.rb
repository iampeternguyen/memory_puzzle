class Player
  def initialize(board)
    @board = board.game_board
    @board_size = @board.length
    @known = Array.new(@board_size) {Array.new(@board_size)}
  end

  def get_input1
    print "Enter a location: "
    input = gets.chomp.split(" ").map {|pos| pos.to_i}
    if !input.length == 2
      puts "Invalid input. Please enter a two digit position separated by a space."
      self.prompt_user
    else
      return input
    end
  end

  def get_input2(*args)
    get_input1
  end

  def save_card(*args)
    #dummy function
  end
end
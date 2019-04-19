class Player
  def initialize(board_size)
  end

  def get_input(board_size)
    print "Enter a location: "
    input = gets.chomp.split(" ").map {|pos| pos.to_i}
    if !input.length == 2
      puts "Invalid input. Please enter a two digit position separated by a space."
      self.prompt_user
    else
      return input
    end
  end
end
class Player
  def initialize

  end

  def prompt_user
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
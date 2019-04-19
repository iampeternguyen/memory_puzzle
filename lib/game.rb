require_relative "board.rb"

class Game
  def initialize
    @board = Board.new(4)
    @prev_guesses = []
  end

  def play
    while !@board.won?
      @board.render
      pos1 = prompt_user
      card1 = @board.get_card(pos1)
      @board.reveal(pos1)
      @board.render
      pos2 = prompt_user
      card2 = @board.get_card(pos2)

      @board.reveal(pos2)
      @board.render

      sleep(1)

      if card1 != card2
        card1.hide
        card2.hide
      end
    end
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

if __FILE__ == $PROGRAM_NAME
  game = Game.new()
  game.play
end

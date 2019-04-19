require_relative "board.rb"
require_relative "player.rb"

class Game
  def initialize
    @board = Board.new(2)
    @prev_guesses = []
    @player = Player.new
  end

  def play
    while !@board.won?
      @board.render
      pos1 = @player.prompt_user
      card1 = @board.get_card(pos1)
      @board.reveal(pos1)
      @board.render
      pos2 = @player.prompt_user
      card2 = @board.get_card(pos2)

      @board.reveal(pos2)
      @board.render

      sleep(1)

      if card1 != card2
        card1.hide
        card2.hide
      end
    end
    puts "You win!"
  end


end

if __FILE__ == $PROGRAM_NAME
  game = Game.new()
  game.play
end

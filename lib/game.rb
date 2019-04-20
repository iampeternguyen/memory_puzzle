require_relative "board.rb"
require_relative "player.rb"
require_relative "aiplayer.rb"

class Game
  GAME_SIZE = 4 #must be even number
  def initialize
    @board = Board.new(GAME_SIZE)
    @prev_guesses = []
    @player = AiPlayer.new(@board)
  end

  def play
    while !@board.won?
      @board.render
      pos1 = @player.get_input1
      card1 = @board.get_card(pos1)

      @board.reveal(pos1)
      @board.render

      pos2 = @player.get_input2(pos1)
      card2 = @board.get_card(pos2)


      @board.reveal(pos2)
      @board.render

      sleep(1)

      if card1 != card2
        @player.save_card(card1, pos1)
        @player.save_card(card2, pos2)
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

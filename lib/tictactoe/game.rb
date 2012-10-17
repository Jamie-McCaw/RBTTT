class Game

  def initialize(output)
    @output = output
  end

  def start
    @output.puts 'Welcome to Tic Tac Toe!'
    @output.puts <<-BOARD
         0 | 1 | 2
        ---+---+---
         3 | 4 | 5
        ---+---+---
         6 | 7 | 8
     BOARD
    @output.puts "It is X's turn"
    @output.puts "-> "
  end

end

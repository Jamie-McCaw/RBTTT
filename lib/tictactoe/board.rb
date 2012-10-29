class Board
  attr_accessor :cells

  def initialize(cells = [0,1,2,3,4,5,6,7,8])
  	@cells = cells
  end

  def dup
  	Board.new(@cells.dup)
  end

  def available_moves
    @cells.inject(0) do |sum, cell|
      sum += (cell.is_a?(Numeric) ? 1 : 0 )
    end
  end

  def move_available?(cell)
    @cells[cell].is_a?(Numeric)
  end

  def move(cell, type)
    if move_available?(cell)
      @cells[cell] = type
    end
  end

  def game_over?
    return true if winner
    return true if available_moves < 1
    false
  end

  def tie?
    return true if !winner && available_moves < 1
  end

  def winner
    return 'X' if player_wins?('X')
    return 'O' if player_wins?('O')
    return nil
  end

  def player_wins?(type)
    winning_moves.each do |move_set|
      if move_set.all? { |cell| cell == type}
        return true
      end
    end
    return false
  end

  def board_design
    board = <<-BOARD
#{@cells[0]} | #{@cells[1]} | #{@cells[2]}
---+---+---
#{@cells[3]} | #{@cells[4]} | #{@cells[5]}
---+---+---
#{@cells[6]} | #{@cells[7]} | #{@cells[8]}
BOARD
  end

  def winning_moves
    [
    [ @cells[0], @cells[1], @cells[2] ],
    [ @cells[3], @cells[4], @cells[5] ],
    [ @cells[6], @cells[7], @cells[8] ],

    [ @cells[0], @cells[3], @cells[6] ],
    [ @cells[1], @cells[4], @cells[7] ],
    [ @cells[2], @cells[5], @cells[8] ],

    [ @cells[0], @cells[4], @cells[8] ],
    [ @cells[6], @cells[4], @cells[2] ]
    ]
  end
end

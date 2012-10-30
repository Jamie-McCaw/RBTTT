class AI
    
    attr_accessor :type

    def initialize(type)
      @type = type
    end

    def make_move(board)
      negamax(board, @type, 1)
      return @best_move
    end

    def opponent(piece)
      piece == 'X' ? 'O' : 'X'
    end

    def winner(board, player)
      if board.winner == player
        return 1
      elsif board.winner == opponent(player)
        return -1
      else
        return 0
      end
    end

    def negamax(board, player, depth)
      if board.game_over?
        return winner(board, player)
      else
        best_rank = -999
        opponent = opponent(player)

        for i in 0..(board.cells.count)
          if board.move_available?(i)
            current_board = board.dup
            current_board.move(i, player)
            rank = -negamax(current_board, opponent, depth + 1)
            if rank > best_rank
              best_rank = rank
              @best_move = i if depth == 1
            end
          end
        end
        return best_rank
      end
    end
  end

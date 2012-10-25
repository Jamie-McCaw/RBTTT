require 'spec_helper'

describe Game do

    let(:io)     { stub(InputOutput.class) }
    let(:game)   { Game.new(io) }
    let(:ai)     { AI.new('O')}
    let(:board)  { Board.new }


  describe "start" do

    it "shows the welcome message" do
      io.should_receive(:outputs).with("Welcome to Tic Tac Toe!")
      game.print_welcome_message
    end

    it "prints out the board" do
      io.should_receive(:outputs).with(board.board_design)
      game.print_board
    end

    it "shows whos turn it is" do
      io.should_receive(:outputs).with("It is X's turn")
      game.print_player_x_turn
    end

    it "shows a prompt for input" do
      io.should_receive(:prints).with("-> ")
      game.print_input_symbol
    end

    it "gets input from the player" do
      io.should_receive(:input).and_return('X')
      io.input.should == 'X'
    end
  end

  describe "game" do

    it "displays invalid_move" do
      io.should_receive(:outputs).with("Invalid Choice")
      game.should_receive(:get_move)
      game.invalid_move
    end                                                                                                    

    it "runs through end_turn" do
      game.should_receive(:draw_board)
      game.should_receive(:check_game_state)
      game.should_receive(:computer_turn)
      game.should_receive(:check_game_state)
      game.end_turn
    end

    it "sets up the game board" do
      game.should_receive(:clear_screen)
      game.should_receive(:print_welcome_message)
      game.should_receive(:print_board)
      game.should_receive(:print_player_x_turn)
      game.should_receive(:print_input_symbol)
      game.draw_board
    end

    it "prints the winning message" do
      board_double = mock "Board"
      io.stub(:outputs)
      game.board = board_double
      board_double.should_receive(:winner).exactly(2).times.and_return('X')
      game.print_winning_message
    end

    it "validates user input" do
      stubbed = 0
      io.stub(:input) {stubbed}
      game.should_receive(:validate_user_input).with(stubbed)
      game.get_move
    end
  end

  describe "end" do
    it "tests whether the game is won" do
      game.check_game_state.should be_false
    end
  end

  describe "#clear_screen" do
    it "clears the screen" do
      game.should_receive('system').with('clear')
      game.clear_screen
    end
  end

  describe "computer_turn" do
    it "goes through the computers turn" do
      io.should_receive(:outputs).with("Thinking...")
      ai_double = mock "AI"
      game.ai = ai_double
      ai_double.should_receive(:make_move).and_return(0)
      game.computer_turn
    end
  end

end

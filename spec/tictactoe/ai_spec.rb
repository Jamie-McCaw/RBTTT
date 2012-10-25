require 'spec_helper'

	describe AI do
		
	let(:board) { Board.new }
	let(:ai)		{ AI.new('O') }
		
	  describe "ai" do

	    it "makes the computer win" do
	      board.move(0,'O')
	      board.move(1,'O')
	      ai.make_move(board).should == 2
	    end

	    it "makes the computer block" do
	      board.move(3, 'X')
	      board.move(0, 'O')
	      board.move(5, 'X')
	      ai.make_move(board).should == 4
	    end
	  end
	end
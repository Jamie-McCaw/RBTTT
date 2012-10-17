require 'spec_helper'

describe Game do
  describe "start" do

    let(:output) { double('output').as_null_object }
    let(:game)   { Game.new(output) }

    after(:each) { game.start }

    it "sends a welcome message" do
      output.should_receive(:puts).with('Welcome to Tic Tac Toe!')
    end

    it "shows the board" do
      output.should_receive(:puts).with(<<-BOARD
         0 | 1 | 2
        ---+---+---
         3 | 4 | 5
        ---+---+---
         6 | 7 | 8
        BOARD
        )
    end

    it "shows whos turn it is" do
      output.should_receive(:puts).with("It is X's turn")
    end

    it "shows a prompt for input" do
      output.should_receive(:puts).with("-> ")
    end
  end
end

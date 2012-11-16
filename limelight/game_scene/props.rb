# This file (props.rb) defines all the props that appear in a scene when loaded.  It makes use of the
# PropBuilder DSL.
#
# For more information see: http://limelightwiki.8thlight.com/index.php/A_Cook%27s_Tour_of_Limelight#PropBuilder_DSL

limelight_board :id => "limelight_board" do

	board do
		(0..8).each { |num| cell :id => num, :styles => 'cell'}
	end

	output_label do
		display_text :id => 'display', :styles => 'display_text', :text => "It is X's turn."
	end

	button_row do
	new_game_button :text => "New Game", :styles => "button"
    exit_button :text => "Exit", :styles => "button"
  end
end
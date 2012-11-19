# This file (props.rb) defines all the props that appear in a scene when loaded.  It makes use of the
# PropBuilder DSL.
#
# For more information see: http://limelightwiki.8thlight.com/index.php/A_Cook%27s_Tour_of_Limelight#PropBuilder_DSL


limelight_board :id => "limelight_board" do

	logo do
		ttt_button :text => "Tic", :styles => "text"
		ttt_button :text => "Tac", :styles => "text"
		ttt_button :text => "Toe", :styles => "text"
	end	


	button_row do
    start_button :text => "Start", :styles => "button"
    exit_button :text => "Exit", :styles => "button"
  end
end
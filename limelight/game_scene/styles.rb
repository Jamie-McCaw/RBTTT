# This file, (styles.rb) inside a scene, should define any styles specific to the containing scene.
# It makes use of the StyleBuilder DSL.
#
# For more information see: http://limelightwiki.8thlight.com/index.php/A_Cook%27s_Tour_of_Limelight#Styling_with_styles.rb
# For a complete listing of style attributes see: http://limelightwiki.8thlight.com/index.php/Style_Attributes

limelight_board {
	background_color :white
	horizontal_alignment :center
	vertical_alignment :top
	width 350
	height 520
	padding 20
}
output_label {
	width 300
	height 60
	top_margin 10
}
board {
	width 300
	height 300
}
cell {
	height 100
	width 100
	border_color :black
	border_width 2
	horizontal_alignment :center
	vertical_alignment :center
	font_size 48
}
button_row {
  width 300
  height :auto
  horizontal_alignment :center
}

button {
  width 150
  height 30
  rounded_corner_radius 2
  border_color :black
  border_width 1
  font_size 12
  background_color :blue
  text_color :white
  horizontal_alignment :center
  vertical_alignment :center
  right_margin 5
  left_margin 5
}
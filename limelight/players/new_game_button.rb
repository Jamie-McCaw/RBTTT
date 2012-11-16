module NewGameButton

	def mouse_clicked(event)
		scene.load('game_scene').start_game
	end
end
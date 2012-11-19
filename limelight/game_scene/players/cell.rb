module Cell
	def mouse_clicked(event)
		scene.make_move(id)
	end

	def mouse_entered(event)
		prop = scene.find(id)
		prop.style.background_color = :blue
		prop.style.text_color = :white
	end

	def mouse_exited(event)
		prop = scene.find(id)
		prop.style.background_color = :white
		prop.style.text_color = :black 
	end
end
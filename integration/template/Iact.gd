extends IactBase

#func _input(ev: InputEvent) -> void:
	#if ev is InputEventKey && ev.is_pressed():
		#set_param("some_param", "some value")

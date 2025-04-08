extends Node

class_name IactBase

signal changed

func set_param(property, value):
	set(property, value)
	changed.emit()

func change(ignore):
	changed.emit()

func _input(ev: InputEvent) -> void:
	if ev is InputEventKey:
		if ev.is_pressed():
			on_key_press(ev)
		elif ev.is_released():
			on_key_release(ev)
		
func on_key_press(ev:InputEventKey):
	pass

func on_key_release(ev:InputEventKey):
	pass

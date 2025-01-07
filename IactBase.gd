extends Node

class_name IactBase

signal changed

func set_param(property, value):
	set(property, value)
	changed.emit()

extends Fn

class_name FnGuFromPs

@export var ps_gu:PackedScene

func exec():
	return ps_gu.instantiate()

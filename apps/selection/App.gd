extends AppBase

#@export var dummy = 0

func ld():
	iact.arr_characters = LoadUtil.load_resources_at("res://db/rs-character/")

extends AppBase

#@export var dummy = 0

func map_data_to_iact():
	iact.arr_characters = LoadUtil.load_resources_at("res://db/rs-character/")

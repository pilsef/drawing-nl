extends AppBase

@export var data_is_on = false

func map_data_to_iact():
	iact.is_on = data_is_on

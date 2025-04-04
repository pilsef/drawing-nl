extends AppBase

@export var data_is_on = false

func ld():
	iact.is_on = data_is_on

func sv():
	data_is_on = iact.is_on
	save_self()

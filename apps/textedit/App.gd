extends AppBase

@export var data_string = ""

func ld():
	iact.string = data_string

func sv():
	data_string = iact.string
	save_self()

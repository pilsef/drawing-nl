extends OrchBase

@export var data_string = ""

func map_data_to_iact():
	iact.string = data_string
	
func map_iact_to_rq_gu(rq_gu):
	rq_gu.string = iact.string
	rq_gu.show_cursor = iact.cursor_visible

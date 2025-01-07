extends OrchBase

@export var data_is_on = false

func map_data_to_iact():
	iact.is_on = data_is_on
	
func map_iact_to_rq_gu(rq_gu):
	rq_gu.is_on = iact.is_on

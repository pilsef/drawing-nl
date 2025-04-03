extends OrchBase

#@export var dummy = 0

func map_data_to_iact():
	iact.arr_characters = LoadUtil.load_resources_at("res://db/rs-character/")
	
func map_iact_to_rq_gu(rq_gu):
	rq_gu.idx_selected = iact.idx_selected
	rq_gu.arr_characters = iact.arr_characters
	rq_gu.num_cols = iact.num_cols

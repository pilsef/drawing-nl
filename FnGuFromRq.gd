extends Resource

class_name FnGuFromRq

export (Resource) var rq

func exec():
	
	var rq_col_keys = create_rq_chain(Vector2(0,1))
	var rq_col_vals = create_rq_chain(Vector2(0,1))
	
	for prop in rq.get_property_list():
		if prop.usage == 8199:
			rq_col_keys.arr_rq_gu.append(create_rq_str(prop["name"]))
			rq_col_vals.arr_rq_gu.append(create_rq_str(rq.get(prop["name"])))
			
	var rq_row_kv = FnGuChain.new()
	rq_row_kv.arr_rq_gu.append(rq_col_keys)
	rq_row_kv.arr_rq_gu.append(rq_col_vals)
	
	var rq_col = create_rq_chain(Vector2(0.5,1), Vector2(0,1))
	rq_col.arr_rq_gu.append(create_rq_str(rq.resource_path.get_file().get_basename()))
	rq_col.arr_rq_gu.append(rq_row_kv)
	
	return rq_col.exec()

#func exec_v1():
#	var rq_col = FnGuChain.new()
#	rq_col.pos_next_rel = Vector2(0,1)
#
#	for prop in rq.get_property_list():
#		if prop.usage == 8199:
#			var rq_row = create_rq_row([prop["name"], rq.get(prop["name"])])
#			rq_col.arr_rq_gu.append(rq_row)
#
#	return rq_col.exec()

#export var pos_next_rel = Vector2(1,0)
#export var dir_next = Vector2(1,1)

func create_rq_chain(pos_next_rel = Vector2(1,0), dir_next = Vector2(1,1)):
	var rq_col = FnGuChain.new()
	rq_col.pos_next_rel = pos_next_rel
	rq_col.dir_next = dir_next
	return rq_col

func create_rq_row(arr_str):
	var rq_row = FnGuChain.new()
	
	for string in arr_str:
		rq_row.arr_rq_gu.append(create_rq_str(string))
	
	return rq_row
	
func create_rq_str(string):
	var rq_str = FnGuFromStr.new()
	rq_str.txt = str(string)
	return rq_str
	
